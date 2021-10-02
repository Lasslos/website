import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/routing/side_menu_items.dart';
import 'package:website/widgets/side_menu_item_widget.dart';

import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (ResponsiveWidget.isSmallScreenSize(context)) _buildTitle(),
          _buildSideMenuColumn(),
        ],
      );

  Widget _buildTitle() => DrawerHeader(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Image.asset(
                'icons/icon.png',
                width: 46,
              ),
            ),
            const CustomText('Canada', size: 36, weight: FontWeight.bold),
          ],
        ),
      );

  Widget _buildSideMenuColumn() {
    var children = <Widget>[];
    for (var element in sideMenuItems) {
      children.add(Container(height: 10));
      children.add(SideMenuItemWidget(sideMenuItem: element));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
