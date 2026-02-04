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

  // ==================== Pre-computed Properties ====================

  /// Inventory list with merged in-memory quantities
  final List<SellJewelryEntity> inventoryWithQuantities;

  /// Items with quantityToSell > 0
  final List<SellJewelryEntity> itemsToSell;

  /// Total number of items to sell
  final int totalItemsToSell;

  /// Estimated total price
  final double estimatedTotal;

  /// Items pending sync count
  final int pendingSyncCount;

  const SellJewelryState({
    this.inventoryList = const [],
    this.screenStatus = SellJewelryScreenStatus.initial,
    this.isOnline = false,
    this.errorMessage,
    this.isSelectionMode = false,
    this.selectedIds = const {},
    this.quantitiesToSell = const {},
    this.inventoryWithQuantities = const [],
    this.itemsToSell = const [],
    this.totalItemsToSell = 0,
    this.estimatedTotal = 0,
    this.pendingSyncCount = 0,
  });

  /// Get quantity to sell for an item
  int getQuantityToSell(String id) => quantitiesToSell[id] ?? 0;

  SellJewelryState copyWith({
    List<SellJewelryEntity>? inventoryList,
    SellJewelryScreenStatus? screenStatus,
    bool? isOnline,
    String? Function()? errorMessage,
    bool? isSelectionMode,
    Set<String>? selectedIds,
    Map<String, int>? quantitiesToSell,
    List<SellJewelryEntity>? inventoryWithQuantities,
    List<SellJewelryEntity>? itemsToSell,
    int? totalItemsToSell,
    double? estimatedTotal,
    int? pendingSyncCount,
  }) {
    return SellJewelryState(
      inventoryList: inventoryList ?? this.inventoryList,
      screenStatus: screenStatus ?? this.screenStatus,
      isOnline: isOnline ?? this.isOnline,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
      selectedIds: selectedIds ?? this.selectedIds,
      quantitiesToSell: quantitiesToSell ?? this.quantitiesToSell,
      inventoryWithQuantities: inventoryWithQuantities ?? this.inventoryWithQuantities,
      itemsToSell: itemsToSell ?? this.itemsToSell,
      totalItemsToSell: totalItemsToSell ?? this.totalItemsToSell,
      estimatedTotal: estimatedTotal ?? this.estimatedTotal,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
    );
  }
}
