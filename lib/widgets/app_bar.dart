import 'package:flutter/material.dart';
import 'package:website/constants/style.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

AppBar buildAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) => AppBar(
  backgroundColor: base,
  leading: ResponsiveWidget.isSmallScreenSize(context) ? IconButton(
      onPressed: () {
        var state = scaffoldKey.currentState;
        if (state == null) {
          return;
        }
        state.isDrawerOpen ? state.openEndDrawer() : state.openDrawer();
        scaffoldKey.currentState!.openDrawer();
      },
      icon: Icon(Icons.menu, color: style.base_contrast,),
  ) : Row(
    children: [
      Container(
        padding: EdgeInsets.only(left: 10),
        child: Image.asset(
          'icons/icon.png',
          width: 46,
        ),
      ),
    ],
  ),
  title: Row(
    children: [
      if (!ResponsiveWidget.isSmallScreenSize(context))
        CustomText('Canada', size: 20, weight: FontWeight.bold,),

      Expanded(child: Container()),
      IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: CustomText('Ich habe noch keine Funktion.', color: Colors.white,)
              )
          );
        },
        icon: Icon(Icons.notifications, color: style.primary,),
      ),
      Container(
        width: 1,
        height: 22,
        color: style.inactive,
      ),
      SizedBox(width: 20,),
      CustomText('Laslo Hauschild', color: inactive,),
      SizedBox(width: 20,),
      Container(
        decoration: BoxDecoration(
            color: style.primary,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.person_outline, color: style.base_contrast),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: CustomText('Ich habe noch keine Funktion.', color: Colors.white,)
                  )
                );
              },
            ),
          ),
        ),
      )
    ],
  ),
);
