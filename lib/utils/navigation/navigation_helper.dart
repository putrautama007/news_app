import 'package:flutter/material.dart';

abstract class NavigationHelper {
  Future<dynamic>? pushNamed(
    String routeName, {
    dynamic arguments,
  });
}

class NavigationHelperImpl extends NavigationHelper {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<dynamic>? pushNamed(
    String routeName, {
    arguments,
  }) =>
      navigatorKey.currentState?.pushNamed(
        routeName,
        arguments: arguments,
      );
}
