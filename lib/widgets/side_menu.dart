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
            Padding(
              padding: const EdgeInsets.all(20),
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
      children.add(Padding(
        //Padding around whole page makes it look weird with left padding
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 20),
        child: SideMenuItemWidget(sideMenuItem: element),
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
