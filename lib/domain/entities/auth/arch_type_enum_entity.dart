enum ArchTypeEnumEntity {
  neutral('NEUTRAL'),
  high('HIGH'),
  low('LOW');

  final String name;
  const ArchTypeEnumEntity(this.name);

  static ArchTypeEnumEntity fromString(String name) {
    return ArchTypeEnumEntity.values.firstWhere((e) => e.name == name);
  }
}
