import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/side_menu_controller.dart';
import 'package:website/pages/all_posts/all_posts.dart';
import 'package:website/pages/login/login.dart';
import 'package:website/pages/not_found/not_found.dart';
import 'package:website/pages/overview/overview.dart';
import 'package:website/pages/post/post.dart';

final MyRoute overview_route = MyRoute('Überblick', '/', Icons.view_compact_outlined, Icons.view_compact, () => OverviewPage());
final MyRoute last_post_route = MyRoute('Letzter Post', '/post?id=lastest', Icons.landscape_outlined, Icons.landscape, () => PostPage());
final MyRoute all_posts_route = MyRoute('Alle Posts', '/all_posts', Icons.view_array_outlined, Icons.view_array, () => AllPostsPage());
final MyRoute login_route = MyRoute('Login', '/login_page', Icons.login_outlined, Icons.login, () => LoginPage());
final MyRoute not_found_route = MyRoute('Not Found', '/not_found', Icons.error_outline_outlined, Icons.error, () => NotFoundPage());
final MyRoute post_route = MyRoute('Post', '/post', Icons.photo_outlined, Icons.photo, () => PostPage());

final List<MyRoute> sideMenuRoutes = [overview_route, last_post_route, all_posts_route, login_route];
final List<MyRoute> allRoutes = [overview_route, last_post_route, all_posts_route, login_route, not_found_route, post_route];

class MyRoute {
  final String name;
  final String path;
  final IconData icon_active;
  final IconData icon_inactive;

  final Widget Function() build;

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