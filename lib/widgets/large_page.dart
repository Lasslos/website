import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/helpers/local_navigator.dart';
import 'package:website/widgets/side_menu.dart';

import 'custom_text.dart';

class LargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(
        color: style.base,
        child: Row(
          children: [
            Expanded(child: SideMenu()),
            Container(
              width: 1,
              color: style.inactive,
              margin: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: localNavigator(),
              ),
            ),
          ],
        ),
      );
}
