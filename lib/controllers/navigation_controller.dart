import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/routing/routes.dart';

NavigationController navigationController = NavigationController.instance;

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic>? navigateTo(MyRoute route) => navigatorKey.currentState?.pushNamed(route.name);
  void goBack() => navigatorKey.currentState?.pop();
}