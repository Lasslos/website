import 'package:flutter/material.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

class MyAppBar {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyAppBar({required this.scaffoldKey});

  AppBar build(BuildContext context) => AppBar(

    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ResponsiveWidget.isSmallScreenSize(context)
          ? IconButton(
        onPressed: () {
          var state = scaffoldKey.currentState;
          if (state == null) {
            return;
          }
          state.isDrawerOpen ? state.openEndDrawer() : state.openDrawer();
          scaffoldKey.currentState!.openDrawer();
        },
        icon: Icon(Icons.menu), //TODO: Color
      )
          : Image.asset(
        'icons/icon.png',
        width: 46,
      ),
    ),
    title: Row(
      children: [
        if (!ResponsiveWidget.isSmallScreenSize(context))
          const CustomText(
            'Canada',
            size: 20,
            weight: FontWeight.bold,
          ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Ich habe noch keine Funktion')],
                ),
              ),
            );
          },
          icon: const Icon(Icons.notifications),
        ),
        Container(
          width: 1,
          height: 22,
          color: style.gray,
        ),
        const SizedBox(
          width: 20,
        ),
        const CustomText(
          'Laslo Hauschild',
          color: style.gray,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
