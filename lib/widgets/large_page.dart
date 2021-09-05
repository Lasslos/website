import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/helpers/local_navigator.dart';
import 'package:website/widgets/side_menu.dart';

import 'custom_text.dart';

class LargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        color: style.base,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 55 - 100, //Size of screen minus size of appBar minus size of information bar below.
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SideMenu()
            ),
            Container(
              width: 1,
              color: style.inactive,
              margin: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: style.base,
                margin: EdgeInsets.all(20),
                child: localNavigator(),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
        child: Container(
          color: style.base_contrast,
          child: Center(
            child: CustomText(
              '',
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
  );
}
