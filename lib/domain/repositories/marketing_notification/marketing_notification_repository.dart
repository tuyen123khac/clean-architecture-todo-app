import '../../entities/notification/notification_entity.dart';

abstract class MarketingNotificationRepository {
  /// Stream of marketing notifications
  Stream<NotificationEntity> watchNotifications();

  /// Start the notification scheduler
  void startScheduler();

  /// Stop the notification scheduler
  void stopScheduler();
}
