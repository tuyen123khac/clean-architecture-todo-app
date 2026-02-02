enum Gender { male, female, other }

class SalesPersonEntity {
  final String id;
  final String name;
  final String phone;
  final int age;
  final Gender gender;
  final String description;
  final String imageUrl;

  const SalesPersonEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.description,
    required this.imageUrl,
  });

  SalesPersonEntity copyWith({
    String? id,
    String? name,
    String? phone,
    int? age,
    Gender? gender,
    String? description,
    String? imageUrl,
  }) {
    return SalesPersonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
