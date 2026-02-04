import '../buy_jewelry/jewelry_category_enum_entity.dart';

enum SellJewelrySyncStatus { synced, pending }

class SellJewelryEntity {
  final String id;
  final String name;
  final JewelryCategoryEnumEntity category;
  final double price;
  final String? imageUrl;
  final int stock;
  final int quantityToSell;
  final String? weight;
  final String? size;
  final String? material;
  final SellJewelrySyncStatus syncStatus;
  final DateTime createdAt;

  SellJewelryEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.imageUrl,
    this.stock = 0,
    this.quantityToSell = 0,
    this.weight,
    this.size,
    this.material,
    this.syncStatus = SellJewelrySyncStatus.synced,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  bool get isSynced => syncStatus == SellJewelrySyncStatus.synced;

  SellJewelryEntity copyWith({
    String? id,
    String? name,
    JewelryCategoryEnumEntity? category,
    double? price,
    String? Function()? imageUrl,
    int? stock,
    int? quantityToSell,
    String? Function()? weight,
    String? Function()? size,
    String? Function()? material,
    SellJewelrySyncStatus? syncStatus,
    DateTime? createdAt,
  }) {
    return SellJewelryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl != null ? imageUrl() : this.imageUrl,
      stock: stock ?? this.stock,
      quantityToSell: quantityToSell ?? this.quantityToSell,
      weight: weight != null ? weight() : this.weight,
      size: size != null ? size() : this.size,
      material: material != null ? material() : this.material,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
