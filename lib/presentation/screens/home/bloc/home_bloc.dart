import 'dart:async';

import '../../../../application/use_case/use_case.dart';
import '../../../../domain/entities/notification/notification_entity.dart';
import '../../../../domain/use_cases/buy_jewelry/watch_wishlist.dart';
import '../../../../domain/use_cases/marketing_notification/watch_marketing_notifications.dart';
import '../../../../domain/use_cases/sell_jewelry/watch_sell_jewelry.dart';
import '../../../base_bloc/base_cubit.dart';
import 'home_state.dart';

class HomeBloc extends BaseCubit<HomeState> {
  final WatchWishlist _watchWishlist;
  final WatchSellJewelry _watchSellJewelry;
  final WatchMarketingNotifications _watchMarketingNotifications;

  StreamSubscription? _wishlistSubscription;
  StreamSubscription? _sellJewelrySubscription;
  StreamSubscription<NotificationEntity>? _notificationSubscription;

  HomeBloc(
    this._watchWishlist,
    this._watchSellJewelry,
    this._watchMarketingNotifications,
  ) : super(const HomeState());

  // ==================== Lifecycle ====================

  void initState() {
    _subscribeToWishlist();
    _subscribeToSellJewelry();
    _subscribeToMarketingNotifications();
  }

  @override
  Future<void> close() {
    _wishlistSubscription?.cancel();
    _sellJewelrySubscription?.cancel();
    _notificationSubscription?.cancel();
    return super.close();
  }

  // ==================== Subscriptions ====================

  void _subscribeToWishlist() {
    _wishlistSubscription = _watchWishlist.call(NoParams()).listen((wishlist) {
      emit(state.copyWith(wishlistCount: wishlist.length));
    });
  }

  void _subscribeToSellJewelry() {
    _sellJewelrySubscription = _watchSellJewelry.call(NoParams()).listen((items) {
      final pendingCount = items.where((item) => !item.isSynced).length;
      emit(
        state.copyWith(
          sellJewelryCount: items.length,
          pendingSyncCount: pendingCount,
        ),
      );
    });
  }

  void _subscribeToMarketingNotifications() {
    _notificationSubscription =
        _watchMarketingNotifications.call(NoParams()).listen(_onNotificationReceived);
  }

  void _onNotificationReceived(NotificationEntity notification) {
    emit(state.copyWith(notificationToShow: () => notification));
  }

  /// Call this after showing the notification to clear the one-shot event
  void clearNotificationToShow() {
    emit(state.copyWith(notificationToShow: () => null));
  }
}
