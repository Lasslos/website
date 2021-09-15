import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/side_menu_controller.dart';
import 'package:website/pages/AbstractPage.dart';
import 'package:website/pages/all_posts/all_posts.dart';
import 'package:website/pages/login/login.dart';
import 'package:website/pages/not_found/not_found.dart';
import 'package:website/pages/overview/overview.dart';
import 'package:website/pages/post/post.dart';

final MyRouteInformation overview_route = MyRouteInformation('Überblick', '/', Icons.view_compact_outlined, Icons.view_compact, OverviewPage());
final MyRouteInformation last_post_route = MyRouteInformation('Letzter Post', '/post?id=lastest', Icons.landscape_outlined, Icons.landscape, PostPage());
final MyRouteInformation all_posts_route = MyRouteInformation('Alle Posts', '/all_posts', Icons.view_array_outlined, Icons.view_array, AllPostsPage());
final MyRouteInformation login_route = MyRouteInformation('Login', '/login_page', Icons.login_outlined, Icons.login, LoginPage());
final MyRouteInformation not_found_route = MyRouteInformation('Not Found', '/not_found', Icons.error_outline_outlined, Icons.error, NotFoundPage());
final MyRouteInformation post_route = MyRouteInformation('Post', '/post', Icons.photo_outlined, Icons.photo, PostPage());

final List<MyRouteInformation> sideMenuRoutes = [overview_route, last_post_route, all_posts_route, login_route];
final List<MyRouteInformation> allRoutes = [overview_route, last_post_route, all_posts_route, login_route, not_found_route, post_route];

class MyRouteInformation extends Comparable<String> {
  final String name;
  final String path;
  final IconData icon_active;
  final IconData icon_inactive;

  final AbstractPage abstractPage;

  MyRouteInformation(this.name, this.path, this.icon_inactive, this.icon_active, this.abstractPage);

  RouteState get routeState {
    if (side_menu_controller.isActive(this)) {
      return RouteState.ACTIVE;
    }
    if (side_menu_controller.isHovered(this)) {
      return RouteState.HOVER;
    }
    return  RouteState.INACTIVE;
  }

  Obx buildRouteStateWidget(Widget Function(RouteState state) build) {
    var activeRoute = side_menu_controller.activeRoute;
    var hoverRoute = side_menu_controller.hoverRoute;
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

  //Used to determine which path of multiple instances is matching the best
  //to a given new route path. For example, "/post" matches "/post" better than
  //"/post?id=lastest". To do that, we count how many chars from otherPath are
  //not matching ourPath, where the first not-matching letter makes 
  @override
  int compareTo(String otherPath) {
    
  }
}

enum RouteState {
  ACTIVE, HOVER, INACTIVE
}