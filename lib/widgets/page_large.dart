import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;

import 'custom_text.dart';

class LargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: style.light,
              ),
            ),
            Container(
              width: 1,
              color: style.light_gray,
              margin: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: style.light,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: CustomText(
                    'Hier scheint es noch nichts zu geben... Komm später wieder.',
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
        child: Container(
          color: style.darker,
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
