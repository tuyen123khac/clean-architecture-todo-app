import 'package:flutter/material.dart';

import 'app_nav_observer.dart';

class RouteObserverManager {
  static List<NavigatorObserver> listRouteObserver = [
    AppNavObserver(),
  ];
}
