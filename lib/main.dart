import 'package:flutter/material.dart';

import 'application/resource/styles/theme_manager.dart';
import 'application/util/notification_util.dart';
import 'data/di/service_locator.dart';
import 'presentation/globals/providers/global_bloc_provider.dart';
import 'presentation/l10n/support_locales.dart';
import 'presentation/navigation/app_navigation.dart';
import 'presentation/navigation/app_routes.dart';
import 'presentation/navigation/observer/route_observer_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  injectDependencies();

  // Initialize notifications
  await NotificationUtil.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalBlocProviders(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // Localization
        localizationsDelegates: localeDelegates,
        supportedLocales: supportLocales,

        // Theme
        themeMode: ThemeMode.light,
        theme: ThemeApp.getTheme(),

        // Navigation
        navigatorKey: AppNavigation.navigatorKey,
        onGenerateRoute: AppNavigation.getRoutes,
        initialRoute: AppRoutes.splash,
        navigatorObservers: RouteObserverManager.listRouteObserver,
      ),
    );
  }
}
