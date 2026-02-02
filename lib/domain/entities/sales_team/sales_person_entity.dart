class SalesPersonEntity {
  final String name;
  final String phone;
  final int age;
  final String description;
  final String imageUrl;
  final bool isFavorite;

  const SalesPersonEntity({
    required this.name,
    required this.phone,
    required this.age,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
  });

  SalesPersonEntity copyWith({
    String? name,
    String? phone,
    int? age,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return SalesPersonEntity(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
