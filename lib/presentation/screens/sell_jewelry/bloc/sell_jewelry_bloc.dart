import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';
import '../../../../domain/use_cases/sell_jewelry/add_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/delete_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/update_sell_jewelry.dart';
import '../../../../domain/use_cases/sell_jewelry/watch_sell_jewelry.dart';
import '../../../base_bloc/base_cubit.dart';
import 'sell_jewelry_state.dart';

class SellJewelryBloc extends BaseCubit<SellJewelryState> {
  final WatchSellJewelry _watchSellJewelry;
  final AddSellJewelry _addSellJewelry;
  final UpdateSellJewelry _updateSellJewelry;
  final DeleteSellJewelry _deleteSellJewelry;
  final InternetConnection _internetConnection;

  StreamSubscription<List<SellJewelryEntity>>? _inventorySubscription;
  StreamSubscription<InternetStatus>? _connectivitySubscription;

  /// Recently deleted item for undo functionality
  SellJewelryEntity? _recentlyDeletedItem;

  SellJewelryBloc(
    this._watchSellJewelry,
    this._addSellJewelry,
    this._updateSellJewelry,
    this._deleteSellJewelry,
    this._internetConnection,
  ) : super(const SellJewelryState());

  void initState() {
    _subscribeToInventory();
    _subscribeToConnectivity();
  }

  @override
  Future<void> close() {
    _inventorySubscription?.cancel();
    _connectivitySubscription?.cancel();
    return super.close();
  }

  void _subscribeToInventory() {
    emit(state.copyWith(screenStatus: SellJewelryScreenStatus.loading));

    _inventorySubscription = _watchSellJewelry.call().listen(
      (inventoryList) {
        emit(state.copyWith(
          inventoryList: inventoryList,
          screenStatus: SellJewelryScreenStatus.success,
          errorMessage: () => null,
        ));
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

  Future<void> addJewelry(SellJewelryEntity entity) async {
    try {
      await _addSellJewelry.call(AddSellJewelryParams(
        entity: entity,
        quantity: entity.stock,
      ));
    } catch (_) {
      // Error handling - the watch will reflect the actual state
    }
  }

  Future<void> updateJewelry(SellJewelryEntity entity) async {
    try {
      await _updateSellJewelry.call(entity);
    } catch (_) {
      // Error handling - the watch will reflect the actual state
    }
  }

  Future<void> deleteJewelry(String id) async {
    // Store for undo
    _recentlyDeletedItem = state.inventoryList.firstWhere(
      (item) => item.id == id,
      orElse: () => throw Exception('Item not found'),
    );

    try {
      await _deleteSellJewelry.call(id);
    } catch (_) {
      _recentlyDeletedItem = null;
    }
  }

  Future<bool> undoDelete() async {
    if (_recentlyDeletedItem == null) return false;

    try {
      await _addSellJewelry.call(AddSellJewelryParams(
        entity: _recentlyDeletedItem!,
        quantity: _recentlyDeletedItem!.stock,
      ));
      _recentlyDeletedItem = null;
      return true;
    } catch (_) {
      return false;
    }
  }

  bool get canUndoDelete => _recentlyDeletedItem != null;

  void incrementQuantity(int index) {
    if (index >= state.inventoryList.length) return;

    final item = state.inventoryList[index];
    if (item.quantityToSell >= item.stock) return;

    final updatedItem = item.copyWith(quantityToSell: item.quantityToSell + 1);
    _updateSellJewelry.call(updatedItem);
  }

  void decrementQuantity(int index) {
    if (index >= state.inventoryList.length) return;

    final item = state.inventoryList[index];
    if (item.quantityToSell <= 0) return;

    final updatedItem = item.copyWith(quantityToSell: item.quantityToSell - 1);
    _updateSellJewelry.call(updatedItem);
  }

  Future<bool> sellItems() async {
    final itemsToSell = state.itemsToSell;
    if (itemsToSell.isEmpty) return false;

    try {
      for (final item in itemsToSell) {
        final newStock = item.stock - item.quantityToSell;
        if (newStock <= 0) {
          // Remove item if stock becomes 0
          await _deleteSellJewelry.call(item.id);
        } else {
          // Update with reduced stock and reset quantityToSell
          final updatedItem = item.copyWith(
            stock: newStock,
            quantityToSell: 0,
            syncStatus: state.isOnline
                ? SellJewelrySyncStatus.synced
                : SellJewelrySyncStatus.pending,
          );
          await _updateSellJewelry.call(updatedItem);
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  void bulkSelect() {
    // Select all items by setting quantityToSell to stock for each
    for (int i = 0; i < state.inventoryList.length; i++) {
      final item = state.inventoryList[i];
      if (item.quantityToSell < item.stock) {
        final updatedItem = item.copyWith(quantityToSell: item.stock);
        _updateSellJewelry.call(updatedItem);
      }
    }
  }

  void clearSelection() {
    // Reset all quantityToSell to 0
    for (final item in state.inventoryList) {
      if (item.quantityToSell > 0) {
        final updatedItem = item.copyWith(quantityToSell: 0);
        _updateSellJewelry.call(updatedItem);
      }
    }
  }

  Future<void> retry() async {
    _inventorySubscription?.cancel();
    _subscribeToInventory();
  }
}
