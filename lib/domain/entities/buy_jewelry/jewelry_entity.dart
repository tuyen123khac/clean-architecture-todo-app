class JewelryEntity {
  final String id;
  final String name;
  final String category;
  final String material;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  const JewelryEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.material,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  JewelryEntity copyWith({
    String? id,
    String? name,
    String? category,
    String? material,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return JewelryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      material: material ?? this.material,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
