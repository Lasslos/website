import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:website/helpers/responsiveness.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/widgets/custom_text.dart';

AppBar buildAppBar(
        BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) =>
    AppBar(
      leading: ResponsiveWidget.isSmallScreenSize(context)
          ? IconButton(
              onPressed: () {
                var state = scaffoldKey.currentState;
                if (state == null) {
                  return;
                }
                state.isDrawerOpen ? state.openEndDrawer() : state.openDrawer();
                scaffoldKey.currentState!.openDrawer();
              },
              //Get.theme.colorScheme.onBackground doesn't work for some reason.
              icon: Icon(Icons.menu,
                  color: style.getOnBackgroundColor(Get.theme.brightness)),
            )
          : Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
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
            const CustomText(
              'Canada',
              size: 20,
              weight: FontWeight.bold,
            ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              Get.rawSnackbar(
                messageText: const CustomText('Ich habe noch keine Funktion.'),
                //color
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
          Container(
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: Get.theme.colorScheme.background,
                child: IconButton(
                  icon: Icon(Icons.person_outline,
                      color: style.getOnBackgroundColor(Get.theme.brightness)),
                  onPressed: () {
                    Get.rawSnackbar(
                        messageText:
                            const Text('Ich habe noch keine Funktion.'));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
