import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/resource/colors/app_colors.dart';
import '../../../application/resource/fonts/app_font.dart';
import '../../../application/resource/strings/app_strings.dart';
import '../../../application/resource/styles/app_text_style.dart';
import '../../../application/resource/value_manager.dart';
import '../../../domain/entities/notification/notification_entity.dart';
import '../../custom_widgets/app_bar/custom_app_bar.dart';
import '../../globals/global_states/global_notification/global_notification_bloc.dart';
import '../../globals/global_states/global_notification/global_notification_bloc_selector.dart';
import '../../navigation/app_navigation.dart';
import 'widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mark all as read when screen opens
    context.read<GlobalNotificationBloc>().markAllAsRead();

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      titleWidget: Text(
        AppStrings.notifications,
        style: AppTextStyles.bold(
          fontSize: AppFontSize.s20,
          color: AppColors.textBlack,
        ),
      ),
      backgroundColor: AppColors.bgWhite,
      leadingWidget: const Icon(Icons.arrow_back_ios, size: SizeApp.s20),
      onPressLeftIcon: () => AppNavigation.pop(context),
      actionButtons: [_buildClearAllButton(context)],
    );
  }

  Widget _buildClearAllButton(BuildContext context) {
    return GlobalNotificationListSelector(
      builder: (notifications) {
        if (notifications.isEmpty) {
          return const SizedBox.shrink();
        }
        return TextButton(
          onPressed: () {
            context.read<GlobalNotificationBloc>().clearAll();
          },
          child: Text(
            AppStrings.clearAll,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s14,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return GlobalNotificationListSelector(
      builder: (notifications) {
        if (notifications.isEmpty) {
          return _buildEmptyState();
        }
        return _buildNotificationList(context, notifications);
      },
    );
  }

  Widget _buildNotificationList(
    BuildContext context,
    List<NotificationEntity> notifications,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.all(PaddingApp.p16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const SizedBox(height: SizeApp.s12),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(
          notification: notification,
          onDelete: () {
            context.read<GlobalNotificationBloc>().deleteNotification(
              notification.id,
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: SizeApp.s64,
            color: AppColors.textGray,
          ),
          const SizedBox(height: SizeApp.s16),
          Text(
            AppStrings.noNotifications,
            style: AppTextStyles.medium(
              fontSize: AppFontSize.s16,
              color: AppColors.textDarkGray,
            ),
          ),
          const SizedBox(height: SizeApp.s8),
          Text(
            AppStrings.noNotificationsSubtitle,
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s14,
              color: AppColors.textGray,
            ),
          ),
        ],
      ),
    );
  }
}
