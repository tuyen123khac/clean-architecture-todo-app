import '../../repositories/marketing_notification/marketing_notification_repository.dart';

class StartNotificationScheduler {
  final MarketingNotificationRepository _repository;

  const StartNotificationScheduler(this._repository);

  void call() {
    _repository.startScheduler();
  }
}
