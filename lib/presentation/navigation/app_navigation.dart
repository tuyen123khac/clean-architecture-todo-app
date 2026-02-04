import 'package:flutter/material.dart';

import '../screens/buy_jewelry/buy_jewelry_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/jewelry_detail/jewelry_detail_screen.dart';
import '../screens/notification/notification_screen.dart';
import '../screens/sales_team/sales_team_screen.dart';
import '../screens/sell_jewelry/sell_jewelry_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'app_routes.dart';

class AppNavigation {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static String? getCurrentRouteName() {
    String? currentRouteName;
    navigatorKey.currentState?.popUntil((route) {
      currentRouteName = route.settings.name;
      // return true so popUntil do nothing
      return true;
    });
    return currentRouteName;
  }

  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: routeSettings,
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );

      case AppRoutes.salesTeam:
        return MaterialPageRoute(
          builder: (_) => const SalesTeamScreen(),
          settings: routeSettings,
        );

      case AppRoutes.buyJewelry:
        return MaterialPageRoute(
          builder: (_) => const BuyJewelryScreen(),
          settings: routeSettings,
        );

      case AppRoutes.jewelryDetail:
        return MaterialPageRoute(
          builder: (_) => const JewelryDetailScreen(),
          settings: routeSettings,
        );

      case AppRoutes.sellJewelry:
        return MaterialPageRoute(
          builder: (_) => const SellJewelryScreen(),
          settings: routeSettings,
        );

      case AppRoutes.notification:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
          settings: routeSettings,
        );
    }
  }

  static Widget _buildPageForRoute(String name, Object? args) {
    switch (name) {
      case AppRoutes.splash:
        return const SplashScreen();
      case AppRoutes.home:
        return const HomeScreen();
      case AppRoutes.salesTeam:
        return const SalesTeamScreen();
      case AppRoutes.buyJewelry:
        return const BuyJewelryScreen();
      case AppRoutes.jewelryDetail:
        return const JewelryDetailScreen();
      case AppRoutes.sellJewelry:
        return const SellJewelryScreen();
      case AppRoutes.notification:
        return const NotificationScreen();
      default:
        return const Placeholder();
    }
  }

  static Future<T?> routeTo<T extends Object?>(
    BuildContext context,
    String name, {
    Object? args,
  }) {
    return Navigator.of(context).pushNamed(name, arguments: args);
  }

  static Future<T?> replaceWith<T extends Object?>(
    BuildContext context,
    String name, {
    Object? agrs,
  }) {
    return Navigator.of(context).pushReplacementNamed(name, arguments: agrs);
  }

  /*
  * Use for normal case, back to previous screen
  */
  static Future<bool> back<T extends Object>(
    BuildContext context, [
    T? result,
  ]) {
    return Navigator.of(context).maybePop(result);
  }

  /// Clears stack and pushes [name]. When [transitionDuration] is set, uses a
  /// custom transition (e.g. for Hero); otherwise uses the default route.
  /// This function is in experimental stage, use with caution.
  static Future<T?> popAllAndRouteTo<T extends Object?>(
    BuildContext context,
    String name, {
    Object? agrs,
    Duration? transitionDuration,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transitionsBuilder,
  }) {
    if (transitionDuration == null) {
      return Navigator.of(context).pushNamedAndRemoveUntil<T>(
        name,
        (Route<dynamic> route) => false,
        arguments: agrs,
      );
    }
    final routeSettings = RouteSettings(name: name, arguments: agrs);
    return Navigator.of(context).pushAndRemoveUntil<T>(
      PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            _buildPageForRoute(name, agrs),
        transitionDuration: transitionDuration,
        reverseTransitionDuration: transitionDuration,
        transitionsBuilder:
            transitionsBuilder ??
            (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
      ),
      (Route<dynamic> route) => false,
    );
  }

  /*
  * pop will ignore the "WillPopScope" widget and force to go back to previous page
  * Using for a dialog sets "willPopScope = false"
  */
  static void pop<T extends Object>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  static void popUntil<T extends Object>(
    BuildContext context,
    String name, [
    T? result,
  ]) {
    Navigator.of(context).popUntil(ModalRoute.withName(name));
  }

  static void popUntilRoot<T extends Object>(
    BuildContext context, [
    T? result,
  ]) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static void popDialog<T extends Object>(BuildContext context, [T? result]) {
    Navigator.of(context, rootNavigator: true).pop(result);
  }
}
