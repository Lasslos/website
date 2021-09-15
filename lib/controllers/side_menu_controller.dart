import 'package:get/get.dart';
import 'package:website/routing/my_route_information.dart';

final SideMenuController side_menu_controller = Get.find();

class SideMenuController extends GetxController {
  Rx<MyRouteInformation> activeRoute = sideMenuRoutes.first.obs;
  Rx<MyRouteInformation?> hoverRoute = Rx<MyRouteInformation?>(null);

  bool isActive(MyRouteInformation route) => route == activeRoute.value;
  bool isHovered(MyRouteInformation route) => route == hoverRoute.value;
}