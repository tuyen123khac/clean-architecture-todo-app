import '../../../../domain/entities/buy_jewelry/buy_jewelry_entity.dart';

class JewelryDetailState {
  final BuyJewelryEntity? jewelry;
  final int quantity;
  final bool isFavorite;
  final double appBarTitleOpacity;

  const JewelryDetailState({
    this.jewelry,
    this.quantity = 1,
    this.isFavorite = false,
    this.appBarTitleOpacity = 0.0,
  });

  double get totalPrice => (jewelry?.price ?? 0) * quantity;

  JewelryDetailState copyWith({
    BuyJewelryEntity? Function()? jewelry,
    int? quantity,
    bool? isFavorite,
    double? appBarTitleOpacity,
  }) {
    return JewelryDetailState(
      jewelry: jewelry != null ? jewelry() : this.jewelry,
      quantity: quantity ?? this.quantity,
      isFavorite: isFavorite ?? this.isFavorite,
      appBarTitleOpacity: appBarTitleOpacity ?? this.appBarTitleOpacity,
    );
  }
}
