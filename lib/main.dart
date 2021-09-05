import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/controllers/menu_controller.dart';
import 'package:website/controllers/navigation_controller.dart';
import 'package:website/page_layout.dart';
import 'package:website/constants/style.dart' as style;

void main() {
  Get.put(NavigationController());
  Get.put(MenuController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Canada - Laslo Hauschild',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: style.primary,
      textTheme: GoogleFonts.inikaTextTheme(
        Theme.of(context).textTheme
      ).apply(
        bodyColor: Colors.black
      ),
      pageTransitionsTheme: _buildPageTransitionTheme(),
    ),
    home: PageLayout(),
  );

  PageTransitionsTheme _buildPageTransitionTheme() {
    var result = <TargetPlatform, PageTransitionsBuilder>{};
    TargetPlatform.values.forEach((element) {
      result[element] = FadeUpwardsPageTransitionsBuilder();
    });
    return PageTransitionsTheme(builders: result);
  }
}