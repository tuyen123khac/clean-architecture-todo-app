import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/notification/notification_entity.dart';
import 'global_notification_bloc.dart';
import 'global_notification_state.dart';

class GlobalNotificationUnreadCountSelector
    extends BlocSelector<GlobalNotificationBloc, GlobalNotificationState, int> {
  GlobalNotificationUnreadCountSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.unreadCount,
          builder: (_, count) => builder(count),
        );
}

class GlobalNotificationListSelector extends BlocSelector<GlobalNotificationBloc,
    GlobalNotificationState, List<NotificationEntity>> {
  GlobalNotificationListSelector({
    super.key,
    required Widget Function(List<NotificationEntity>) builder,
  }) : super(
          selector: (state) => state.notifications,
          builder: (_, notifications) => builder(notifications),
        );
}
