import 'package:flutter/material.dart';

import '../routes/navigation_observer.dart';
import '../routes/route_matcher.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  factory NavigationService() => _instance;

  Future<dynamic> pushWithArguments(
    BuildContext context,
    String routePath, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamed(context, routePath, arguments: arguments);
  }

  Future<dynamic> push(
    BuildContext context,
    String routePath,
  ) async {
    return await Navigator.pushNamed(context, routePath);
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }

  popUntil(BuildContext context, String routePath) {
    Navigator.popUntil(context, ModalRoute.withName(routePath));
  }

  Future<dynamic> pushAndPopUntil(
      BuildContext context, String routePath) async {
    return await Navigator.pushNamedAndRemoveUntil(
        context, routePath, (route) => false);
  }

  bool containsOnGlobalRouteStack(String routeName, BuildContext context) {
    final routeMatchPredicate = RouteMatcher.matchParameterizedRoute(routeName);
    for (final route in routeStack) {
      if (route == null) continue;
      final bool exists = routeMatchPredicate(route);
      if (exists) {
        return true;
      }
    }
    return false;
  }
}
