import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../domain/entities/sales_member/sales_gender_enum_entity.dart';
import '../../../../domain/entities/sales_member/sales_member_entity.dart';
import '../../../custom_widgets/button/custom_filled_button.dart';
import 'profile_image.dart';

class SalesPersonCard extends StatelessWidget {
  final SalesMemberEntity salesPerson;
  final VoidCallback? onCallPressed;

  const SalesPersonCard({
    super.key,
    required this.salesPerson,
    this.onCallPressed,
  });

  // Cache the card decoration to avoid recreating on every build
  static final _cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: BlurRadiusApp.b10,
        offset: OffsetApp.o04,
      ),
    ],
  );

  // Cache gender badge decorations
  static final _maleBadgeDecoration = BoxDecoration(
    color: Colors.blue.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
  );

  static final _femaleBadgeDecoration = BoxDecoration(
    color: Colors.pink.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
  );

  @override
  Widget build(BuildContext context) {
    // RepaintBoundary isolates this widget's repaints from the rest of the tree
    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.only(bottom: MarginApp.m16),
        decoration: _cardDecoration,
        child: Padding(
          padding: const EdgeInsets.all(PaddingApp.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: SizeApp.s12),
              _buildDescription(),
              const SizedBox(height: SizeApp.s16),
              _buildCallButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(imageUrl: salesPerson.imageUrl, age: salesPerson.age),
        const SizedBox(width: SizeApp.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                salesPerson.name,
                style: AppTextStyles.semiBold(
                  fontSize: AppFontSize.s18,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(height: SizeApp.s4),
              Row(
                children: [
                  Icon(
                    Icons.phone_outlined,
                    size: SizeApp.s16,
                    color: AppColors.textDarkGray,
                  ),
                  const SizedBox(width: SizeApp.s6),
                  Text(
                    salesPerson.phone,
                    style: AppTextStyles.regular(
                      fontSize: AppFontSize.s14,
                      color: AppColors.textDarkGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildGenderBadge(),
      ],
    );
  }

  Widget _buildGenderBadge() {
    final isMale = salesPerson.gender == SalesGenderEnumEntity.male;
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
            color: isMale ? Colors.blue : Colors.pink,
          ),
          const SizedBox(width: SizeApp.s4),
          Text(
            isMale ? AppStrings.male : AppStrings.female,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s12,
              color: isMale ? Colors.blue : Colors.pink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      salesPerson.description,
      style: AppTextStyles.regular(
        fontSize: AppFontSize.s14,
        color: AppColors.textDarkGray,
        lineHeight: 20,
      ),
    );
  }

  Widget _buildCallButton() {
    return SizedBox(
      width: double.infinity,
      height: ButtonSizeApp.height,
      child: CustomFilledButton(
        label: AppStrings.callNow,
        icon: Icons.phone,
        onPressed: onCallPressed,
      ),
    );
  }
}
