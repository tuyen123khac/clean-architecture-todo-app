import 'dart:async';

import '../../../../domain/entities/notification/notification_entity.dart';
import '../../../../domain/use_cases/marketing_notification/watch_marketing_notifications.dart';
import '../../../base_bloc/base_cubit.dart';
import 'global_notification_state.dart';

class GlobalNotificationBloc extends BaseCubit<GlobalNotificationState> {
  final WatchMarketingNotifications _watchMarketingNotifications;

  StreamSubscription<NotificationEntity>? _notificationSubscription;

  GlobalNotificationBloc(this._watchMarketingNotifications)
      : super(const GlobalNotificationState());

  // ==================== Lifecycle ====================

  void initState() {
    _subscribeToNotifications();
    _watchMarketingNotifications.startScheduler();
  }

  @override
  Future<void> close() {
    _notificationSubscription?.cancel();
    _watchMarketingNotifications.stopScheduler();
    return super.close();
  }

  // ==================== Notification Subscription ====================

  void _subscribeToNotifications() {
    _notificationSubscription =
        _watchMarketingNotifications.call().listen(_onNotificationReceived);
  }

  void _onNotificationReceived(NotificationEntity notification) {
    final newNotifications = [notification, ...state.notifications];
    emit(state.copyWith(
      notifications: newNotifications,
      unreadCount: state.unreadCount + 1,
    ));
  }

  // ==================== Public Methods ====================

  void deleteNotification(String id) {
    final newNotifications =
        state.notifications.where((n) => n.id != id).toList();
    emit(state.copyWith(notifications: newNotifications));
  }

  void markAllAsRead() {
    emit(state.copyWith(unreadCount: 0));
  }

  void clearAll() {
    emit(state.copyWith(notifications: [], unreadCount: 0));
  }
}
