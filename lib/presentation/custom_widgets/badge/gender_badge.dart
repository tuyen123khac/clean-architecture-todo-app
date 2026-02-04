import 'package:flutter/material.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../domain/entities/sales_member/sales_gender_enum_entity.dart';

class GenderBadge extends StatelessWidget {
  final SalesGenderEnumEntity gender;

  const GenderBadge({super.key, required this.gender});

  static final _maleBadgeDecoration = BoxDecoration(
    color: AppColors.maleLight,
    borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
  );

  static final _femaleBadgeDecoration = BoxDecoration(
    color: AppColors.femaleLight,
    borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
  );

  @override
  Widget build(BuildContext context) {
    final isMale = gender == SalesGenderEnumEntity.male;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p8,
        vertical: PaddingApp.p4,
      ),
      decoration: isMale ? _maleBadgeDecoration : _femaleBadgeDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isMale ? Icons.male : Icons.female,
            size: SizeApp.s16,
            color: isMale ? AppColors.male : AppColors.female,
          ),
          const SizedBox(width: SizeApp.s4),
          Text(
            isMale ? AppStrings.male : AppStrings.female,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s12,
              color: isMale ? AppColors.male : AppColors.female,
            ),
          ),
        ],
      ),
    );
  }
}
