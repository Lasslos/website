import 'package:flutter/material.dart';
import 'package:website/constants/style.dart';

class LargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          color: red,
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          color: green,
        ),
      ),
    ],
  );
}
