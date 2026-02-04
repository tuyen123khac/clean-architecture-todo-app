import '../../entities/notification/notification_entity.dart';
import '../../repositories/marketing_notification/marketing_notification_repository.dart';

class WatchMarketingNotifications {
  final MarketingNotificationRepository _repository;

  const WatchMarketingNotifications(this._repository);

  Stream<NotificationEntity> call() {
    return _repository.watchNotifications();
  }

  void startScheduler() {
    _repository.startScheduler();
  }

  void stopScheduler() {
    _repository.stopScheduler();
  }
}
