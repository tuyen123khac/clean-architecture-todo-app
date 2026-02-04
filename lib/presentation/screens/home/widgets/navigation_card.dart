import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';

class NavigationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconBackgroundColor;
  final VoidCallback? onTap;
  final int? badgeCount;
  final Color? badgeColor;

  const NavigationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconBackgroundColor,
    this.onTap,
    this.badgeCount,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(PaddingApp.p16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: OpacityApp.opa10),
              blurRadius: BlurRadiusApp.b10,
              offset: OffsetApp.o04,
            ),
          ],
        ),
        child: Row(
          children: [
            _buildModuleIcon(),
            _buildContent(),
            if (badgeCount != null && badgeCount! > 0) ...[
              _buildBadge(),
              const SizedBox(width: MarginApp.m8),
            ],
            _buildNavigateIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleIcon() {
    return Container(
      width: SizeApp.s48,
      height: SizeApp.s48,
      margin: EdgeInsets.only(right: MarginApp.m16),
      decoration: BoxDecoration(
        color: iconBackgroundColor ?? AppColors.secondaryLight,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Icon(icon, size: SizeApp.s24, color: AppColors.primary),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s16,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s4),
          Text(
            subtitle,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s12,
              color: AppColors.textDarkGray,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingApp.p8,
        vertical: PaddingApp.p4,
      ),
      decoration: BoxDecoration(
        color: badgeColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Text(
        badgeCount.toString(),
        style: AppTextStyles.semiBold(
          fontSize: AppFontSize.s12,
          color: AppColors.textWhite,
        ),
      ),
    );
  }

  Icon _buildNavigateIcon() {
    return Icon(
      Icons.arrow_forward_ios,
      size: SizeApp.s16,
      color: AppColors.textGray,
    );
  }
}
