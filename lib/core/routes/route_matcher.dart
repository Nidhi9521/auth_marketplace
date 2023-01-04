import 'package:flutter/material.dart';

class RouteMatcher {
  static RoutePredicate matchParameterizedRoute(String name) {
    return (Route<dynamic> route) {
      if (route.settings.name != null) {
        final routeName = route.settings.name!.split('/').first;
        return !route.willHandlePopInternally &&
            route is ModalRoute &&
            routeName == name;
      }
      return false;
    };
  }
}
