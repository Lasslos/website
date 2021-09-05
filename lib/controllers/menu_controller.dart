import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:website/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.put(MenuController());
  Rx<MyRoute?> activeRoute = Rx<MyRoute?>(routes.first);
  Rx<MyRoute?> hoverRoute = Rx<MyRoute?>(null);

  bool isActive(MyRoute route) => route == activeRoute.value;
  bool isHovered(MyRoute route) => route == hoverRoute.value;

  Stream<MyRoute?> get changeListenable => rx.Rx.merge([activeRoute.stream, hoverRoute.stream]);
}