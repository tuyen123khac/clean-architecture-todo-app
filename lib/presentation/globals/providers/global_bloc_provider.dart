import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/di/service_locator.dart';
import '../global_states/global_background/global_background_bloc.dart';
import '../global_states/global_notification/global_notification_bloc.dart';
import '../global_states/global_ui/global_ui_bloc.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalUiBloc>.value(
          value: serviceLocator.get<GlobalUiBloc>(),
        ),
        BlocProvider<GlobalBackgroundBloc>.value(
          value: serviceLocator.get<GlobalBackgroundBloc>(),
        ),
        BlocProvider<GlobalNotificationBloc>.value(
          value: serviceLocator.get<GlobalNotificationBloc>(),
        ),
      ],
      child: child,
    );
  }
}
