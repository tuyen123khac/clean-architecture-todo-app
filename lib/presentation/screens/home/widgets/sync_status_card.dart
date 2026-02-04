import 'package:flutter/material.dart';

import '../../../../application/resource/colors/app_colors.dart';
import '../../../../application/resource/fonts/app_font.dart';
import '../../../../application/resource/strings/app_strings.dart';
import '../../../../application/resource/styles/app_text_style.dart';
import '../../../../application/resource/value_manager.dart';
import '../../../../application/util/date_time_utils.dart';
import '../../../globals/global_states/global_background/global_background_state.dart';

class SyncStatusCard extends StatelessWidget {
  final SyncStatus syncStatus;
  final int pendingSyncCount;
  final DateTime? lastSyncedAt;
  final bool isOnline;
  final VoidCallback onTap;

  const SyncStatusCard({
    super.key,
    required this.syncStatus,
    required this.pendingSyncCount,
    required this.lastSyncedAt,
    required this.isOnline,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isTapDisabled = syncStatus == SyncStatus.syncing;

    return GestureDetector(
      onTap: isTapDisabled ? null : () => _handleTap(context),
      child: Container(
        padding: const EdgeInsets.all(PaddingApp.p16),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
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
            _buildIcon(),
            const SizedBox(width: MarginApp.m16),
            _buildContent(),
            _buildTrailing(),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    if (!isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppStrings.networkError),
          backgroundColor: AppColors.warning,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    onTap();
  }

  // ==================== UI Components ====================

  Widget _buildIcon() {
    return Container(
      width: SizeApp.s48,
      height: SizeApp.s48,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        borderRadius: BorderRadius.circular(BorderRadiusApp.r12),
      ),
      child: _buildIconContent(),
    );
  }

  Widget _buildIconContent() {
    if (syncStatus == SyncStatus.syncing) {
      return Padding(
        padding: const EdgeInsets.all(PaddingApp.p12),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      );
    }

    return Icon(
      _getIcon(),
      size: SizeApp.s24,
      color: _getIconColor(),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getTitle(),
            style: AppTextStyles.semiBold(
              fontSize: AppFontSize.s16,
              color: AppColors.textBlack,
            ),
          ),
          const SizedBox(height: SizeApp.s4),
          Text(
            _getSubtitle(),
            style: AppTextStyles.regular(
              fontSize: AppFontSize.s12,
              color: _getSubtitleColor(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrailing() {
    if (syncStatus == SyncStatus.syncing) {
      return const SizedBox.shrink();
    }

    if (syncStatus == SyncStatus.error) {
      return Icon(
        Icons.refresh,
        size: SizeApp.s20,
        color: AppColors.error,
      );
    }

    return Icon(
      Icons.sync,
      size: SizeApp.s20,
      color: AppColors.textGray,
    );
  }

  // ==================== Helpers ====================

  Color _getBackgroundColor() {
    if (syncStatus == SyncStatus.error) {
      return AppColors.error.withValues(alpha: 0.05);
    }
    return Colors.white;
  }

  Color _getIconBackgroundColor() {
    switch (syncStatus) {
      case SyncStatus.syncing:
        return AppColors.primary.withValues(alpha: 0.1);
      case SyncStatus.error:
        return AppColors.error.withValues(alpha: 0.1);
      case SyncStatus.completed:
        return AppColors.success.withValues(alpha: 0.1);
      case SyncStatus.idle:
        return AppColors.bgLightGray;
    }
  }

  IconData _getIcon() {
    switch (syncStatus) {
      case SyncStatus.syncing:
        return Icons.sync;
      case SyncStatus.error:
        return Icons.sync_problem;
      case SyncStatus.completed:
        return Icons.check_circle_outline;
      case SyncStatus.idle:
        return Icons.sync;
    }
  }

  Color _getIconColor() {
    switch (syncStatus) {
      case SyncStatus.syncing:
        return AppColors.primary;
      case SyncStatus.error:
        return AppColors.error;
      case SyncStatus.completed:
        return AppColors.success;
      case SyncStatus.idle:
        return AppColors.primary;
    }
  }

  String _getTitle() {
    switch (syncStatus) {
      case SyncStatus.syncing:
        return AppStrings.syncing;
      case SyncStatus.error:
        return AppStrings.syncFailed;
      case SyncStatus.completed:
        return AppStrings.syncSuccess;
      case SyncStatus.idle:
        return AppStrings.sync;
    }
  }

  String _getSubtitle() {
    if (syncStatus == SyncStatus.error) {
      return AppStrings.tapToRetrySync;
    }
    if (pendingSyncCount > 0) {
      return AppStrings.itemsPendingSync(pendingSyncCount);
    }
    if (lastSyncedAt != null) {
      return AppStrings.lastSynced(lastSyncedAt!.toRelativeTime);
    }
    return AppStrings.neverSynced;
  }

  Color _getSubtitleColor() {
    if (syncStatus == SyncStatus.error) {
      return AppColors.error;
    }
    return AppColors.textDarkGray;
  }
}
