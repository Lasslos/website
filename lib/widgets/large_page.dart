import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/side_menu.dart';

class LargePage extends StatelessWidget {
  final Widget child;
  LargePage(this.child);

  @override
  Widget build(BuildContext context) =>
      Container(
        child: Row(
          children: [
            Expanded(child: SideMenu()),
            Container(
              width: 1,
              color: style.gray,
              margin: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ),
          ],
        ),
      );
}
