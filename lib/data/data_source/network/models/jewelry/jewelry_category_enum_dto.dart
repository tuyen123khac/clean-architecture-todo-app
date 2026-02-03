import 'package:freezed_annotation/freezed_annotation.dart';

enum JewelryCategoryEnumDto {
  @JsonValue('goldSjc')
  goldSjc('goldSjc'),

  @JsonValue('gold24k')
  gold24k('gold24k'),

  @JsonValue('gold18k')
  gold18k('gold18k'),

  @JsonValue('gold14k')
  gold14k('gold14k'),

  @JsonValue('goldWhite')
  goldWhite('goldWhite'),

  @JsonValue('gemstone')
  gemstone('gemstone');

  final String name;
  const JewelryCategoryEnumDto(this.name);

  static JewelryCategoryEnumDto fromString(String name) {
    return JewelryCategoryEnumDto.values.firstWhere((e) => e.name == name);
  }
}
