import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:website/routing/route_information_parser.dart';
import 'package:website/routing/my_route_information.dart';

class MyRouterDelegate extends RouterDelegate<MyRouteInformation> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  MyRouteInformation route = not_found_route;
  Map<String, String> currentArguments = {};

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Navigator(
    key: navigatorKey,
    onGenerateRoute: () {
      var route = allRoutes.firstWhere((element) => )
    },
  );

  @override
  MyRouteInformation? get currentConfiguration {
    //TODO: Return path WITH path of nested navigator!
  }

  @override
  SynchronousFuture<bool> setNewRoutePath(MyRouteInformation configuration) {
    return SynchronousFuture(false);
  }
}