import 'package:flutter/material.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/side_menu.dart';

class LargeLayout extends StatelessWidget {
  final Widget child;

  const LargeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        const Expanded(child: SideMenu()),
        Container(
          width: 1,
          color: style.gray,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
        ),
        Expanded(
          flex: 5,
          child: child,
        ),
      ],
    ),
  );
}