import 'package:flutter/material.dart';
import 'package:get/get.dart';

const SideMenuItem overviewRoute = SideMenuItem(
    'Überblick', '/overview', Icons.view_compact_outlined, Icons.view_compact);
const SideMenuItem lastPostRoute = SideMenuItem('Letzter Post',
    '/last_post', Icons.landscape_outlined, Icons.landscape);
const SideMenuItem allPostsRoute = SideMenuItem(
    'Alle Posts', '/all_posts', Icons.view_array_outlined, Icons.view_array);
const SideMenuItem loginRoute =
    SideMenuItem('Login', '/login', Icons.login_outlined, Icons.login);

final List<SideMenuItem> sideMenuItems = [
  overviewRoute,
  lastPostRoute,
  allPostsRoute,
  loginRoute
];

Rx<SideMenuItem?> hoverRoute = Rx<SideMenuItem?>(null);
Rx<SideMenuItem?> activeRoute = Rx<SideMenuItem?>(sideMenuItems.first);

class SideMenuItem {
  final String name;
  final String path;
  final IconData iconActive;
  final IconData iconInactive;

  const SideMenuItem(this.name, this.path, this.iconInactive, this.iconActive);

  Widget stateBuilder(Widget Function(bool isHovered, bool isActive) builder) =>
      Obx(() => builder(hoverRoute.value == this, activeRoute.value == this));
}
