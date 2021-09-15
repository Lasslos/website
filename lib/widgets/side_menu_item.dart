import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/controllers/side_menu_controller.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/routing/my_route_information.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

class SideMenuItem extends StatelessWidget {
  final MyRouteInformation reference;

  SideMenuItem(this.reference);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool active) {
        side_menu_controller.hoverRoute.value = active ? reference : null;
      },
      onTap: () {
        side_menu_controller.activeRoute.value = reference;
        Get.toNamed(reference.path);
      },
      child: ResponsiveWidget(
        largeSizedWidget: HorizontalSideMenuItem(reference),
        mediumSizedWidget: VerticalSideMenuItem(reference),
        smallSizedWidget: HorizontalSideMenuItem(reference),
      ),
    );
  }
}

class HorizontalSideMenuItem extends StatelessWidget {
  final MyRouteInformation reference;

  const HorizontalSideMenuItem(this.reference);

  @override
  Widget build(BuildContext context) => reference.buildRouteStateWidget((state) =>
      Container(
        color: state != RouteState.INACTIVE ? style.gray.withOpacity(.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: state != RouteState.INACTIVE,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 4,
                height: 60,
              ),
            ),

            SizedBox(width: MediaQuery.of(context).size.width / 75),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                state != RouteState.ACTIVE ? reference.icon_inactive : reference.icon_active,
                size: state == RouteState.INACTIVE ? 20 : 22,
              ),
            ),

            CustomText(
              reference.name,
              size: state == RouteState.INACTIVE ? 16 : 18,
              color: state == RouteState.INACTIVE ? style.gray : null,
              weight: state != RouteState.ACTIVE ? FontWeight.normal : FontWeight.bold,
              selectable: false,
            ),
          ],
        ),
      ),
  );
}

class VerticalSideMenuItem extends StatelessWidget {
  final MyRouteInformation reference;

  const VerticalSideMenuItem(this.reference);

  @override
  Widget build(BuildContext context) => reference.buildRouteStateWidget((state) =>
      Container(
        color: state != RouteState.INACTIVE ? style.gray.withOpacity(.1) : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: state != RouteState.INACTIVE,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                width: 3,
                height: 72,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      state != RouteState.ACTIVE
                          ? reference.icon_inactive
                          : reference.icon_active,
                      size: state == RouteState.INACTIVE ? 20 : 22,
                    ),
                  ),

                  CustomText(
                    reference.name,
                    size: state == RouteState.INACTIVE ? 16 : 18,
                    color: state == RouteState.INACTIVE ? style.gray : null,
                    weight: state != RouteState.ACTIVE ? FontWeight.normal : FontWeight.bold,
                    selectable: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
  );
}
