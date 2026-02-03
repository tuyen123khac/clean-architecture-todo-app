import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';

enum SellJewelryScreenStatus { initial, loading, success, error }

class SellJewelryState {
  final List<SellJewelryEntity> inventoryList;
  final SellJewelryScreenStatus screenStatus;
  final bool isOnline;
  final String? errorMessage;
  final bool isSelectionMode;
  final Set<String> selectedIds;
  /// In-memory quantities to sell (not persisted to DB)
  final Map<String, int> quantitiesToSell;

  const SellJewelryState({
    this.inventoryList = const [],
    this.screenStatus = SellJewelryScreenStatus.initial,
    this.isOnline = true,
    this.errorMessage,
    this.isSelectionMode = false,
    this.selectedIds = const {},
    this.quantitiesToSell = const {},
  });

  /// Get quantity to sell for an item
  int getQuantityToSell(String id) => quantitiesToSell[id] ?? 0;

  /// Inventory list with merged in-memory quantities
  List<SellJewelryEntity> get inventoryWithQuantities => inventoryList.map((item) {
    final qty = quantitiesToSell[item.id] ?? 0;
    return item.copyWith(quantityToSell: qty);
  }).toList();

  /// Items with quantityToSell > 0
  List<SellJewelryEntity> get itemsToSell =>
      inventoryWithQuantities.where((item) => item.quantityToSell > 0).toList();

  /// Total number of items to sell
  int get totalItemsToSell =>
      itemsToSell.fold(0, (sum, item) => sum + item.quantityToSell);

  /// Estimated total price
  double get estimatedTotal =>
      itemsToSell.fold(0, (sum, item) => sum + (item.price * item.quantityToSell));

  /// Items pending sync
  int get pendingSyncCount =>
      inventoryList.where((item) => !item.isSynced).length;

  /// Selected items count
  int get selectedCount => selectedIds.length;

  SellJewelryState copyWith({
    List<SellJewelryEntity>? inventoryList,
    SellJewelryScreenStatus? screenStatus,
    bool? isOnline,
    String? Function()? errorMessage,
    bool? isSelectionMode,
    Set<String>? selectedIds,
    Map<String, int>? quantitiesToSell,
  }) {
    return SellJewelryState(
      inventoryList: inventoryList ?? this.inventoryList,
      screenStatus: screenStatus ?? this.screenStatus,
      isOnline: isOnline ?? this.isOnline,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedIds: selectedIds ?? this.selectedIds,
      quantitiesToSell: quantitiesToSell ?? this.quantitiesToSell,
    );
  }
}
