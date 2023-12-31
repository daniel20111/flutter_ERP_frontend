import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) async {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static pushRefresh(String routeName) {
    return navigatorKey.currentState!.popAndPushNamed(routeName);
  }
}
