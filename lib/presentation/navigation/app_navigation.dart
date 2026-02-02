import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/sales_team/sales_team_screen.dart';
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

      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
          settings: routeSettings,
        );
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

  /// route to screen and remove all the routes from navigator
  static Future<T?> popAllAndRouteTo<T extends Object?>(
    BuildContext context,
    String name, {
    Object? agrs,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      name,
      (Route<dynamic> route) => false,
      arguments: agrs,
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
