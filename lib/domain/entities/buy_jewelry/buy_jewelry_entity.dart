import 'jewelry_category_enum_entity.dart';

class BuyJewelryEntity {
  final String id;
  final String name;
  final JewelryCategoryEnumEntity category;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String? weight;
  final String? size;
  final String? material;
  final int stock;
  final double rating;
  final int reviewCount;
  final String? description;
  final List<String> features;
  final bool isCertified;
  final bool isFavorite;

  const BuyJewelryEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.weight,
    this.size,
    this.material,
    this.stock = 0,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.description,
    this.features = const [],
    this.isCertified = false,
    this.isFavorite = false,
  });

  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  double get discountPercent {
    if (!hasDiscount) return 0;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }

  BuyJewelryEntity copyWith({
    String? id,
    String? name,
    JewelryCategoryEnumEntity? category,
    double? price,
    double? Function()? originalPrice,
    String? imageUrl,
    String? Function()? weight,
    String? Function()? size,
    String? Function()? material,
    int? stock,
    double? rating,
    int? reviewCount,
    String? Function()? description,
    List<String>? features,
    bool? isCertified,
    bool? isFavorite,
  }) {
    return BuyJewelryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice:
          originalPrice != null ? originalPrice() : this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      weight: weight != null ? weight() : this.weight,
      size: size != null ? size() : this.size,
      material: material != null ? material() : this.material,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      description: description != null ? description() : this.description,
      features: features ?? this.features,
      isCertified: isCertified ?? this.isCertified,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
