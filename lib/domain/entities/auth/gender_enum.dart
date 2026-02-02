enum GenderEnum {
  male('MALE'),
  female('FEMALE'),
  other('OTHER');

  final String name;
  const GenderEnum(this.name);

  static GenderEnum fromString(String name) {
    return GenderEnum.values.firstWhere((e) => e.name == name);
  }

}
