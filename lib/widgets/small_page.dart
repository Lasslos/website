import 'package:flutter/material.dart';

class SmallPage extends StatelessWidget {
  final Widget child;
  SmallPage(this.child);

  @override
  Widget build(BuildContext context) =>
      Container(
        margin: EdgeInsets.all(20),
        child: child,
      );
}