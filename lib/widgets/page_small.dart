import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

class SmallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
    children: [
      Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 56 - 100, //Size of screen minus size of appBar minus size of information bar below.
        ),
        color: style.base,
        child: Center(
          child: CustomText(
            'Hier scheint es noch nichts zu geben... Komm später wieder.',
            size: 24,
          ),
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
      ),
    ],
  );
}
