import 'package:flutter/material.dart';

class SmallPage extends StatelessWidget {
  final Widget child;

  const SmallPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(20),
        child: child,
      );
}
