import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../globals/global_states/global_notification/global_notification_bloc_selector.dart';
import '../../../navigation/app_navigation.dart';
import '../../../navigation/app_routes.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalNotificationUnreadCountSelector(
      builder: (unreadCount) {
        return Padding(
          padding: const EdgeInsets.only(right: PaddingApp.p8),
          child: IconButton(
            onPressed: () {
              AppNavigation.routeTo(context, AppRoutes.notification);
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: AppColors.textBlack,
                  size: SizeApp.s28,
                ),
                if (unreadCount > 0) _buildBadge(unreadCount),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(int count) {
    return Positioned(
      right: -4,
      top: -4,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.error,
          shape: BoxShape.circle,
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          count > 9 ? '9+' : count.toString(),
          style: AppTextStyles.bold(
            fontSize: AppFontSize.s10,
            color: AppColors.textWhite,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
