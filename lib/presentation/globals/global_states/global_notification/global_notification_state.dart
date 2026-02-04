import '../../../../domain/entities/notification/notification_entity.dart';

class GlobalNotificationState {
  final List<NotificationEntity> notifications;
  final int unreadCount;

  const GlobalNotificationState({
    this.notifications = const [],
    this.unreadCount = 0,
  });

  GlobalNotificationState copyWith({
    List<NotificationEntity>? notifications,
    int? unreadCount,
  }) {
    return GlobalNotificationState(
      notifications: notifications ?? this.notifications,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }
}
