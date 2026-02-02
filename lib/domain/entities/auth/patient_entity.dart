import 'package:freezed_annotation/freezed_annotation.dart';

import 'arch_type_enum_entity.dart';
import 'gender_enum.dart';
part 'patient_entity.freezed.dart';

@freezed
abstract class PatientEntity with _$PatientEntity {
  const PatientEntity._();

  const factory PatientEntity({
    required int id,
    required String name,
    required String surname,
    required String email,
    required String dateOfBirth,
    required GenderEnum gender,
    required int heightInches,
    required int shoeSizeUs,
    required ArchTypeEnumEntity archType,
    required String podiatristName,
    String? nextTestDate,
    required bool isProfileComplete,
    required bool forceChangePassword,
  }) = _PatientEntity;
}
