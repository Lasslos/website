import 'package:flutter/material.dart';
import 'package:website/constants/style.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

AppBar buildAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) => AppBar(
  backgroundColor: light,
  leading: ResponsiveWidget.isSmallScreenSize(context) ? IconButton(
      onPressed: () {
        var state = scaffoldKey.currentState;
        if (state == null) {
          return;
        }
        state.isDrawerOpen ? state.openEndDrawer() : state.openDrawer();
        scaffoldKey.currentState!.openDrawer();
      },
      icon: Icon(Icons.menu, color: style.darker,),
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
      Visibility(
          visible: !ResponsiveWidget.isSmallScreenSize(context),
          child: CustomText('Canada', size: 20, weight: FontWeight.bold,)
      ),
      Expanded(child: Container()),

      Container(
        width: 1,
        height: 22,
        color: style.light_gray,
      ),
      SizedBox(width: 24,),
      CustomText('Laslo Hauschild', color: light_gray,),
      SizedBox(width: 16,),
      Container(
        decoration: BoxDecoration(
            color: style.red.withOpacity(.5),
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
              tooltip: "I'm not doing anything yet.",
              icon: Icon(Icons.person_outline, color: style.darker),
              onPressed: () {
              },
            ),
          ),
        ),
      )
    ],
  ),
);
