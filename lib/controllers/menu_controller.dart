import 'package:get/get.dart';
import 'package:website/routing/routes.dart';

MenuController menuController = MenuController.instance;

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  Rx<MyRoute> activeRoute = Rx<MyRoute>(routes.first);
  Rx<MyRoute?> hoverRoute = Rx<MyRoute?>(null);

  bool isActive(MyRoute route) => route == activeRoute.value;
  bool isHovered(MyRoute route) => route == hoverRoute.value;
}