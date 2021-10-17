import 'package:flutter/material.dart';

class SmallLayout extends StatelessWidget {
  final Widget child;

  const SmallLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      );
}
