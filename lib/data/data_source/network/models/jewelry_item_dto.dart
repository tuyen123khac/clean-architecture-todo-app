/// DTO for Jewelry catalog API response.
class JewelryItemDto {
  final String id;
  final String name;
  final String category;
  final int price;

  const JewelryItemDto({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });

  factory JewelryItemDto.fromJson(Map<String, dynamic> json) {
    return JewelryItemDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
    );
  }
}
