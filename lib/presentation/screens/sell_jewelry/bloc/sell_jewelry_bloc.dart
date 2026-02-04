import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../../domain/use_cases/sell_jewelry/add_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/delete_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/update_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/watch_sell_jewelry.dart';
import '../../../base_bloc/base_cubit.dart';
import '../../../globals/global_states/global_background/global_background_bloc.dart';
import 'sell_jewelry_state.dart';

class SellJewelryBloc extends BaseCubit<SellJewelryState> {
  final WatchSellJewelry _watchSellJewelry;
  final AddSellJewelry _addSellJewelry;
  final UpdateSellJewelry _updateSellJewelry;
  final DeleteSellJewelry _deleteSellJewelry;
  final InternetConnection _internetConnection;
  final GlobalBackgroundBloc _backgroundBloc;

  StreamSubscription<List<SellJewelryEntity>>? _inventorySubscription;
  StreamSubscription<InternetStatus>? _connectivitySubscription;

  /// Recently deleted items for undo functionality (with their original indices)
  List<({SellJewelryEntity item, int index})> _recentlyDeletedItems = [];

  SellJewelryBloc(
    this._watchSellJewelry,
    this._addSellJewelry,
    this._updateSellJewelry,
    this._deleteSellJewelry,
    this._internetConnection,
    this._backgroundBloc,
  ) : super(const SellJewelryState());

  void initState() {
    _checkInitialConnectivity();
    _subscribeToInventory();
    _subscribeToConnectivity();
  }

  Future<void> _checkInitialConnectivity() async {
    final isConnected = await _internetConnection.hasInternetAccess;
    emit(state.copyWith(isOnline: isConnected));
  }

  @override
  Future<void> close() {
    _inventorySubscription?.cancel();
    _connectivitySubscription?.cancel();
    return super.close();
  }

  // ==================== Subscriptions ====================

  void _subscribeToInventory() {
    emit(state.copyWith(screenStatus: SellJewelryScreenStatus.loading));

    _inventorySubscription = _watchSellJewelry.call().listen(
      (inventoryList) {
        _emitWithComputedValues(
          inventoryList: inventoryList,
          screenStatus: SellJewelryScreenStatus.success,
          errorMessage: () => null,
        );
      },
      onError: (error) {
        emit(state.copyWith(
          screenStatus: SellJewelryScreenStatus.error,
          errorMessage: () => 'Failed to load inventory',
        ));
      },
    );
  }

  void _subscribeToConnectivity() {
    _connectivitySubscription = _internetConnection.onStatusChange.listen(
      (status) {
        emit(state.copyWith(
          isOnline: status == InternetStatus.connected,
        ));
      },
    );
  }

  // ==================== CRUD Operations ====================

  Future<void> addJewelry(SellJewelryEntity entity) async {
    try {
      await _addSellJewelry.call(AddSellJewelryParams(
        entity: entity,
        quantity: entity.stock,
      ));
      // Trigger sync after successful local DB update
      _backgroundBloc.triggerSync();
    } catch (_) {
      // Error handling - the watch will reflect the actual state
    }
  }

  Future<void> updateJewelry(SellJewelryEntity entity) async {
    try {
      await _updateSellJewelry.call(entity);
      // Trigger sync after successful local DB update
      _backgroundBloc.triggerSync();
    } catch (_) {
      // Error handling - the watch will reflect the actual state
    }
  }

  Future<void> deleteJewelry(String id) async {
    // Find item and its index for undo
    final index = state.inventoryList.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final item = state.inventoryList[index];

    // Store for undo (clear previous and store new single item)
    _recentlyDeletedItems = [(item: item, index: index)];

    try {
      await _deleteSellJewelry.call(id);
    } catch (_) {
      _recentlyDeletedItems = [];
    }
  }

  Future<bool> undoDelete() async {
    if (_recentlyDeletedItems.isEmpty) return false;

    try {
      // Sort by index descending to restore in correct order
      final sortedItems = List.of(_recentlyDeletedItems)
        ..sort((a, b) => a.index.compareTo(b.index));

      for (final record in sortedItems) {
        await _addSellJewelry.call(AddSellJewelryParams(
          entity: record.item,
          quantity: record.item.stock,
        ));
      }

      _recentlyDeletedItems = [];
      return true;
    } catch (_) {
      return false;
    }
  }

  int get deletedItemsCount => _recentlyDeletedItems.length;
  bool get canUndoDelete => _recentlyDeletedItems.isNotEmpty;

  // ==================== Quantity Management ====================

  void incrementQuantity(int index) {
    if (index >= state.inventoryList.length) return;

    final item = state.inventoryList[index];
    final currentQty = state.getQuantityToSell(item.id);
    if (currentQty >= item.stock) return;

    final newQuantities = Map<String, int>.from(state.quantitiesToSell);
    newQuantities[item.id] = currentQty + 1;
    _emitWithComputedValues(quantitiesToSell: newQuantities);
  }

  void decrementQuantity(int index) {
    if (index >= state.inventoryList.length) return;

    final item = state.inventoryList[index];
    final currentQty = state.getQuantityToSell(item.id);
    if (currentQty <= 0) return;

    final newQuantities = Map<String, int>.from(state.quantitiesToSell);
    newQuantities[item.id] = currentQty - 1;
    _emitWithComputedValues(quantitiesToSell: newQuantities);
  }

  Future<bool> sellItems() async {
    final itemsToSell = state.itemsToSell;
    if (itemsToSell.isEmpty) return false;

    try {
      for (final item in itemsToSell) {
        final newStock = item.stock - item.quantityToSell;
        // Always update stock (even to 0) and mark as pending
        // The item will only be deleted after successful sync to server
        final originalItem = state.inventoryList.firstWhere((e) => e.id == item.id);
        final updatedItem = originalItem.copyWith(
          stock: newStock,
          syncStatus: SellJewelrySyncStatus.pending,
        );
        await _updateSellJewelry.call(updatedItem);
      }
      // Reset all quantities to sell and trigger sync
      _emitWithComputedValues(quantitiesToSell: {});
      _backgroundBloc.triggerSync();
      return true;
    } catch (_) {
      return false;
    }
  }

  // ==================== Selection Mode (for Bulk Delete) ====================

  void enterSelectionMode() {
    emit(state.copyWith(isSelectionMode: true, selectedIds: {}));
  }

  void exitSelectionMode() {
    emit(state.copyWith(isSelectionMode: false, selectedIds: {}));
  }

  void toggleSelection(String id) {
    final newSelectedIds = Set<String>.from(state.selectedIds);
    if (newSelectedIds.contains(id)) {
      newSelectedIds.remove(id);
    } else {
      newSelectedIds.add(id);
    }
    emit(state.copyWith(selectedIds: newSelectedIds));
  }

  void selectAll() {
    final allIds = state.inventoryList.map((item) => item.id).toSet();
    emit(state.copyWith(selectedIds: allIds));
  }

  void deselectAll() {
    emit(state.copyWith(selectedIds: {}));
  }

  Future<void> deleteSelected() async {
    if (state.selectedIds.isEmpty) return;

    // Store all selected items with their indices for undo
    _recentlyDeletedItems = [];
    for (int i = 0; i < state.inventoryList.length; i++) {
      final item = state.inventoryList[i];
      if (state.selectedIds.contains(item.id)) {
        _recentlyDeletedItems.add((item: item, index: i));
      }
    }

    try {
      for (final id in state.selectedIds) {
        await _deleteSellJewelry.call(id);
      }
      exitSelectionMode();
    } catch (_) {
      _recentlyDeletedItems = [];
    }
  }

  // ==================== Retry ====================

  Future<void> retry() async {
    _inventorySubscription?.cancel();
    _subscribeToInventory();
  }

  // ==================== Helper Methods ====================

  /// Emit state with pre-computed derived values
  void _emitWithComputedValues({
    List<SellJewelryEntity>? inventoryList,
    SellJewelryScreenStatus? screenStatus,
    String? Function()? errorMessage,
    Map<String, int>? quantitiesToSell,
  }) {
    final newInventoryList = inventoryList ?? state.inventoryList;
    final newQuantitiesToSell = quantitiesToSell ?? state.quantitiesToSell;

    // Compute derived values
    final computedValues = _computeDerivedValues(
      inventoryList: newInventoryList,
      quantitiesToSell: newQuantitiesToSell,
    );

    emit(state.copyWith(
      inventoryList: inventoryList,
      screenStatus: screenStatus,
      errorMessage: errorMessage,
      quantitiesToSell: quantitiesToSell,
      inventoryWithQuantities: computedValues.inventoryWithQuantities,
      itemsToSell: computedValues.itemsToSell,
      totalItemsToSell: computedValues.totalItemsToSell,
      estimatedTotal: computedValues.estimatedTotal,
      pendingSyncCount: computedValues.pendingSyncCount,
    ));
  }

  /// Compute all derived values from source data
  _ComputedValues _computeDerivedValues({
    required List<SellJewelryEntity> inventoryList,
    required Map<String, int> quantitiesToSell,
  }) {
    // Inventory with quantities merged
    final inventoryWithQuantities = inventoryList.map((item) {
      final qty = quantitiesToSell[item.id] ?? 0;
      return item.copyWith(quantityToSell: qty);
    }).toList();

    // Items to sell (quantity > 0)
    final itemsToSell = inventoryWithQuantities
        .where((item) => item.quantityToSell > 0)
        .toList();

    // Total items to sell
    final totalItemsToSell = itemsToSell.fold<int>(
      0,
      (sum, item) => sum + item.quantityToSell,
    );

    // Estimated total
    final estimatedTotal = itemsToSell.fold<double>(
      0,
      (sum, item) => sum + (item.price * item.quantityToSell),
    );

    // Pending sync count
    final pendingSyncCount = inventoryList.where((item) => !item.isSynced).length;

    return _ComputedValues(
      inventoryWithQuantities: inventoryWithQuantities,
      itemsToSell: itemsToSell,
      totalItemsToSell: totalItemsToSell,
      estimatedTotal: estimatedTotal,
      pendingSyncCount: pendingSyncCount,
    );
  }
}

/// Helper class to hold computed values
class _ComputedValues {
  final List<SellJewelryEntity> inventoryWithQuantities;
  final List<SellJewelryEntity> itemsToSell;
  final int totalItemsToSell;
  final double estimatedTotal;
  final int pendingSyncCount;

  const _ComputedValues({
    required this.inventoryWithQuantities,
    required this.itemsToSell,
    required this.totalItemsToSell,
    required this.estimatedTotal,
    required this.pendingSyncCount,
  });
}
