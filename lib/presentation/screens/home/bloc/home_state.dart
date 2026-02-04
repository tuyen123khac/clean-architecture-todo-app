import '../../../../domain/entities/notification/notification_entity.dart';

class HomeState {
  final int wishlistCount;
  final int sellJewelryCount;
  final int pendingSyncCount;

  /// Notification to show as system notification (one-shot event)
  final NotificationEntity? notificationToShow;

  const HomeState({
    this.wishlistCount = 0,
    this.sellJewelryCount = 0,
    this.pendingSyncCount = 0,
    this.notificationToShow,
  });

  HomeState copyWith({
    int? wishlistCount,
    int? sellJewelryCount,
    int? pendingSyncCount,
    NotificationEntity? Function()? notificationToShow,
  }) {
    return HomeState(
      wishlistCount: wishlistCount ?? this.wishlistCount,
      sellJewelryCount: sellJewelryCount ?? this.sellJewelryCount,
      pendingSyncCount: pendingSyncCount ?? this.pendingSyncCount,
      notificationToShow: notificationToShow != null
          ? notificationToShow()
          : this.notificationToShow,
    );
  }
}
