import '../../../../domain/entities/sell_jewelry/sell_jewelry_entity.dart';

enum SellJewelryScreenStatus { initial, loading, success, error }

class SellJewelryState {
  final List<SellJewelryEntity> inventoryList;
  final SellJewelryScreenStatus screenStatus;
  final bool isOnline;
  final String? errorMessage;

  const SellJewelryState({
    this.inventoryList = const [],
    this.screenStatus = SellJewelryScreenStatus.initial,
    this.isOnline = true,
    this.errorMessage,
  });

  /// Items with quantityToSell > 0
  List<SellJewelryEntity> get itemsToSell =>
      inventoryList.where((item) => item.quantityToSell > 0).toList();

  /// Total number of items to sell
  int get totalItemsToSell =>
      itemsToSell.fold(0, (sum, item) => sum + item.quantityToSell);

  /// Estimated total price
  double get estimatedTotal =>
      itemsToSell.fold(0, (sum, item) => sum + (item.price * item.quantityToSell));

  /// Items pending sync
  int get pendingSyncCount =>
      inventoryList.where((item) => !item.isSynced).length;

  SellJewelryState copyWith({
    List<SellJewelryEntity>? inventoryList,
    SellJewelryScreenStatus? screenStatus,
    bool? isOnline,
    String? Function()? errorMessage,
  }) {
    return SellJewelryState(
      inventoryList: inventoryList ?? this.inventoryList,
      screenStatus: screenStatus ?? this.screenStatus,
      isOnline: isOnline ?? this.isOnline,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }
}
