import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/widgets/side_menu_item.dart';
import 'package:website/routing/my_route_information.dart';

import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    child: Column(
      children: [
        if (ResponsiveWidget.isSmallScreenSize()) _buildTitle(),
        _buildSideMenuColumn(),
      ],
    ),
  );

  Widget _buildTitle() => DrawerHeader(
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Image.asset(
            'icons/icon.png',
            width: 46,
          ),
        ),
        
        CustomText('Canada', size: 36, weight: FontWeight.bold),
      ],
    ),
  );

  Widget _buildSideMenuColumn() {
    var children = <Widget>[];
    sideMenuRoutes.forEach((element) {
      children.add(Container(height: 10));
      children.add(SideMenuItem(element));
    });
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}
