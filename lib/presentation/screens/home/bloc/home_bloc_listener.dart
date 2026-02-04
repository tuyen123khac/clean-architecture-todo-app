import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/notification/notification_entity.dart';
import 'home_bloc.dart';
import 'home_state.dart';

/// Listener for marketing notification events
class HomeNotificationListener extends BlocListener<HomeBloc, HomeState> {
  HomeNotificationListener({
    super.key,
    required void Function(BuildContext, NotificationEntity) listener,
    super.child,
  }) : super(
          listenWhen: (previous, current) =>
              current.notificationToShow != null &&
              previous.notificationToShow != current.notificationToShow,
          listener: (context, state) {
            final notification = state.notificationToShow;
            if (notification != null) {
              listener(context, notification);
              context.read<HomeBloc>().clearNotificationToShow();
            }
          },
        );
}
