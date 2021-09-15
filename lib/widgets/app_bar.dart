import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

AppBar buildAppBar(GlobalKey<ScaffoldState> scaffoldKey) => AppBar(
  leading: ResponsiveWidget.isSmallScreenSize() ? IconButton(
    onPressed: () {
      var state = scaffoldKey.currentState;
      if (state == null) {
        return;
      }
      state.isDrawerOpen ? state.openEndDrawer() : state.openDrawer();
      scaffoldKey.currentState!.openDrawer();
      },
    //Get.theme.colorScheme.onBackground doesn't work for some reason.
    icon: Icon(Icons.menu, color: style.getOnBackgroundColor(Get.theme.brightness)),
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
      if (!ResponsiveWidget.isSmallScreenSize())
        CustomText('Canada', size: 20, weight: FontWeight.bold,),

      Expanded(child: Container()),

      IconButton(
        onPressed: () {
          Get.rawSnackbar(
            messageText: CustomText('Ich habe noch keine Funktion.'),
            //color
          );
        },
        icon: Icon(Icons.notifications),
      ),
      Container(
        width: 1,
        height: 22,
        color: style.gray,
      ),
      SizedBox(width: 20,),
      CustomText('Laslo Hauschild', color: style.gray,),
      SizedBox(width: 20,),
      Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundColor: Get.theme.colorScheme.background,
            child: IconButton(
              icon: Icon(Icons.person_outline, color: style.getOnBackgroundColor(Get.theme.brightness)),
              onPressed: () {
                Get.rawSnackbar(
                  messageText: Text('Ich habe noch keine Funktion.')
                );
              },
            ),
          ),
        ),
      )
    ],
  ),
);
