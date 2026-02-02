/// DTO for To-Call / sales team API response.
class PersonDto {
  final String id;
  final String name;
  final String job;
  final String phoneNumber;

  const PersonDto({
    required this.id,
    required this.name,
    required this.job,
    required this.phoneNumber,
  });

  factory PersonDto.fromJson(Map<String, dynamic> json) {
    return PersonDto(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      job: json['job'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
    );
  }
}
