import 'sales_gender_enum_entity.dart';
import 'sales_title_enum_entity.dart';

class SalesMemberEntity {
  final int id;
  final String name;
  final SalesGenderEnumEntity gender;
  final int age;
  final SalesTitleEnumEntity title;
  final String phone;
  final String description;
  final String imageUrl;

  const SalesMemberEntity({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.title,
    required this.phone,
    required this.description,
    required this.imageUrl,
  });

  SalesMemberEntity copyWith({
    int? id,
    String? name,
    SalesGenderEnumEntity? gender,
    int? age,
    SalesTitleEnumEntity? title,
    String? phone,
    String? description,
    String? imageUrl,
  }) {
    return SalesMemberEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      title: title ?? this.title,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
