import 'package:flutter/material.dart';
import 'package:website/controllers/navigation_controller.dart';
import 'package:website/routing/routes.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigatorKey,
  onGenerateRoute: (RouteSettings settings) {
    var route = routes.firstWhere((element) => element.name == settings.name, orElse: () => not_found_route);
    return MaterialPageRoute(builder: route.build);
  },
  initialRoute: routes[0].name,
);
