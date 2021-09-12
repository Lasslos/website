import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:website/routing/route_information.dart';

class MyRouterDelegate extends RouterDelegate<RouterInformation> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Navigator(
    key: navigatorKey
  );

  @override
  SynchronousFuture<bool> setNewRoutePath(RouterInformation configuration) {
    return SynchronousFuture(false);
  }
}