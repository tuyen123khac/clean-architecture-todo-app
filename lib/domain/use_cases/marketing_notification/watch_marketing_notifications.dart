import '../../../application/use_case/use_case.dart';
import '../../entities/notification/notification_entity.dart';
import '../../repositories/marketing_notification/marketing_notification_repository.dart';

class WatchMarketingNotifications
    extends StreamUseCase<NotificationEntity, NoParams> {
  final MarketingNotificationRepository _repository;

  const WatchMarketingNotifications(this._repository);

  @override
  Stream<NotificationEntity> call([NoParams? params]) {
    return _repository.watchNotifications();
  }
}
