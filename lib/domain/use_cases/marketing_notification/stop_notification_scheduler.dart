import '../../repositories/marketing_notification/marketing_notification_repository.dart';

class StopNotificationScheduler {
  final MarketingNotificationRepository _repository;

  const StopNotificationScheduler(this._repository);

  void call() {
    _repository.stopScheduler();
  }
}
