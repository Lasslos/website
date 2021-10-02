import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/routing/side_menu_items.dart';
import 'package:website/widgets/custom_text.dart';
import 'package:vrouter/vrouter.dart';

class SideMenuItemWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;

  const SideMenuItemWidget({Key? key, required this.sideMenuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool hovering) {
        hoverRoute.value = hovering ? sideMenuItem : null;
      },
      onTap: () {
        activeRoute.value = sideMenuItem;
        context.vRouter.toNamed(sideMenuItem.path);
      },
      child: ResponsiveWidget(
        largeSizedWidget:
            HorizontalSideMenuItemWidget(sideMenuItem: sideMenuItem),
        mediumSizedWidget:
            VerticalSideMenuItemWidget(sideMenuItem: sideMenuItem),
        smallSizedWidget:
            HorizontalSideMenuItemWidget(sideMenuItem: sideMenuItem),
      ),
    );
  }
}

class HorizontalSideMenuItemWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;

  const HorizontalSideMenuItemWidget({Key? key, required this.sideMenuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) => sideMenuItem.stateBuilder(
        (bool isHovered, bool isActive) => Container(
          color: isHovered || isActive
              ? style.gray.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: isHovered || isActive,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: const SizedBox(
                  width: 4,
                  height: 60,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 75),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  !isActive
                      ? sideMenuItem.iconInactive
                      : sideMenuItem.iconActive,
                  size: !isHovered && !isActive ? 20 : 22,
                ),
              ),
              CustomText(
                sideMenuItem.name,
                size: !isHovered && !isActive ? 16 : 18,
                color: !isHovered && !isActive ? style.gray : null,
                weight: !isActive ? FontWeight.normal : FontWeight.bold,
                selectable: false,
              ),
            ],
          ),
        ),
      );
}

class VerticalSideMenuItemWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;

  const VerticalSideMenuItemWidget({Key? key, required this.sideMenuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) => sideMenuItem.stateBuilder(
        (bool isHovered, bool isActive) => Container(
          color: isHovered || isActive
              ? style.gray.withOpacity(.1)
              : Colors.transparent,
          child: Row(
            children: [
              Visibility(
                visible: isHovered || isActive,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: const SizedBox(
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
                        !isActive
                            ? sideMenuItem.iconInactive
                            : sideMenuItem.iconActive,
                        size: !isHovered && !isActive ? 20 : 22,
                      ),
                    ),
                    CustomText(
                      sideMenuItem.name,
                      size: !isHovered && !isActive ? 16 : 18,
                      color: !isHovered && !isActive ? style.gray : null,
                      weight: !isActive ? FontWeight.normal : FontWeight.bold,
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
