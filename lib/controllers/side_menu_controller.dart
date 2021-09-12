import 'package:get/get.dart';
import 'package:website/routing/routes.dart';

final SideMenuController menuController = Get.find();

class SideMenuController extends GetxController {
  Rx<MyRoute> activeRoute = sideMenuRoutes.first.obs;
  Rx<MyRoute?> hoverRoute = Rx<MyRoute?>(null);

  bool isActive(MyRoute route) => route == activeRoute.value;
  bool isHovered(MyRoute route) => route == hoverRoute.value;
}