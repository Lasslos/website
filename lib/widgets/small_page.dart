import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/helpers/local_navigator.dart';
import 'package:website/widgets/custom_text.dart';

class SmallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(
        color: style.base,
        margin: EdgeInsets.all(20),
        child: localNavigator(),
      );
}