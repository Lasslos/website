import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/helpers/local_navigator.dart';
import 'package:website/widgets/custom_text.dart';

class SmallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 56 - 100, //Size of screen minus size of appBar minus size of information bar below.
        ),
        color: style.base,
        margin: EdgeInsets.all(20),
        child: localNavigator(),
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
