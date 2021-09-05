import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:get/get.dart';
import 'package:website/controllers/menu_controller.dart';

final MyRoute overview_page_route = MyRoute('Überblick', '/', Icons.view_compact_outlined, Icons.view_compact);
final MyRoute last_post_page_route = MyRoute('Letzter Post', '/last_post', Icons.landscape_outlined, Icons.landscape);
final MyRoute all_posts_page_route = MyRoute('Alle Posts', '/all_posts', Icons.view_array_outlined, Icons.view_array);
final MyRoute login_page_route = MyRoute('Login', '/login_page', Icons.login_outlined, Icons.login);

final List<MyRoute> routes = [
  overview_page_route,
  all_posts_page_route,
  last_post_page_route,
  login_page_route,
];

class MyRoute {
  final String name;
  final String path;
  final IconData icon_inactive;
  final IconData icon_active;

  MyRoute(this.name, this.path, this.icon_inactive, this.icon_active);

  RouteState get routeState {
    if (MenuController.instance.isActive(this)) {
      return RouteState.ACTIVE;
    }
    if (MenuController.instance.isHovered(this)) {
      return RouteState.HOVER;
    }
    return  RouteState.INACTIVE;
  }

  Obx buildRouteStateWidget(Widget Function(RouteState state) build) {
    var activeRoute = MenuController.instance.activeRoute;
    var hoverRoute = MenuController.instance.hoverRoute;
    return Obx(() {
      if (activeRoute.value == this) {
        return build(RouteState.ACTIVE);
      }
      if (hoverRoute.value ==  this) {
        return build(RouteState.HOVER);
      }
      return build(RouteState.INACTIVE);
    });
  }
}

enum RouteState {
  ACTIVE, HOVER, INACTIVE
}