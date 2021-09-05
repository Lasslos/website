import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/menu_controller.dart';
import 'package:website/pages/all_posts/all_posts.dart';
import 'package:website/pages/last_post/last_post.dart';
import 'package:website/pages/login/login.dart';
import 'package:website/pages/not_found/not_found.dart';
import 'package:website/pages/overview/overview.dart';

final MyRoute overview_page_route = MyRoute('Überblick', '/', Icons.view_compact_outlined, Icons.view_compact, (context) => OverviewPage());
final MyRoute last_post_page_route = MyRoute('Letzter Post', '/last_post', Icons.landscape_outlined, Icons.landscape, (context) => LastPostPage());
final MyRoute all_posts_page_route = MyRoute('Alle Posts', '/all_posts', Icons.view_array_outlined, Icons.view_array, (context) => AllPostsPage());
final MyRoute login_page_route = MyRoute('Login', '/login_page', Icons.login_outlined, Icons.login, (context) => LoginPage());
final MyRoute not_found_route = MyRoute('Not Found', '/not_found', Icons.error_outline_outlined, Icons.error, (context) => NotFoundPage());

final List<MyRoute> routes = [
  overview_page_route,
  all_posts_page_route,
  last_post_page_route,
  login_page_route,
];

class MyRoute {
  final String name;
  final String path;
  final IconData icon_active;
  final IconData icon_inactive;

  final Widget Function(BuildContext context) build;

  MyRoute(this.name, this.path, this.icon_inactive, this.icon_active, this.build);

  RouteState get routeState {
    if (menuController.isActive(this)) {
      return RouteState.ACTIVE;
    }
    if (menuController.isHovered(this)) {
      return RouteState.HOVER;
    }
    return  RouteState.INACTIVE;
  }

  Obx buildRouteStateWidget(Widget Function(RouteState state) build) {
    var activeRoute = menuController.activeRoute;
    var hoverRoute = menuController.hoverRoute;
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