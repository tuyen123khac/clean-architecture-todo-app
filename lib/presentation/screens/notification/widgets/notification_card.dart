import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/date_time_utils.dart';
import '../../../../domain/entities/notification/notification_entity.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: _buildDismissBackground(),
      child: _buildCard(),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: PaddingApp.p16),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: Icon(
        Icons.delete_outline,
        color: AppColors.textWhite,
        size: SizeApp.s24,
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      padding: const EdgeInsets.all(PaddingApp.p16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: OpacityApp.opa10),
            blurRadius: BlurRadiusApp.b10,
            offset: OffsetApp.o02,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          const SizedBox(width: MarginApp.m12),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: SizeApp.s40,
      height: SizeApp.s40,
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(BorderRadiusApp.r10),
      ),
      child: Icon(
        Icons.local_offer_outlined,
        color: AppColors.primary,
        size: SizeApp.s20,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          style: AppTextStyles.semiBold(
            fontSize: AppFontSize.s14,
            color: AppColors.textBlack,
          ),
        ),
        const SizedBox(height: SizeApp.s4),
        Text(
          notification.body,
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s13,
            color: AppColors.textDarkGray,
          ),
        ),
        const SizedBox(height: SizeApp.s8),
        Text(
          notification.createdAt.toRelativeTime,
          style: AppTextStyles.regular(
            fontSize: AppFontSize.s12,
            color: AppColors.textGray,
          ),
        ),
      ],
    );
  }
}
