import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

class SmallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: Container(
          color: style.light,
          margin: EdgeInsets.all(10),
          child: Center(
            child: CustomText(
              'Hier scheint es noch nichts zu geben... Komm später wieder.',
              size: 24,
            ),
          ),
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
      ),
    ],
  );
}
