import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/controllers/side_menu_controller.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/page_layout.dart';
import 'package:website/routing/route_information_parser.dart';
import 'package:website/routing/router_delegate.dart';
import 'package:website/routing/my_route_information.dart';

void main() {
  Get.put(PageController());
  Get.put(SideMenuController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'Canada - Laslo Hauschild',
    theme: _buildTheme(Brightness.light),
    darkTheme: _buildTheme(Brightness.dark),
    themeMode: ThemeMode.system,
    routerDelegate: MyRouterDelegate(),
    routeInformationParser: MyRouteInformationParser(),
  );

  ThemeData _buildTheme(Brightness brightness) {
    var brightnessColor = style.getBackgroundColor(brightness);
    var antiBrightnessColor = style.getOnBackgroundColor(brightness);

    return ThemeData(
      brightness: brightness,
      primarySwatch: Colors.green,
      backgroundColor: brightnessColor,
      textTheme: _modifyDefaultTextTheme(TextTheme()),
      appBarTheme: AppBarTheme(
        brightness: brightness,
        backgroundColor: brightnessColor,
        foregroundColor: antiBrightnessColor,
        textTheme: _modifyDefaultTextTheme(TextTheme()).apply(displayColor: antiBrightnessColor, bodyColor: antiBrightnessColor),
        iconTheme: IconThemeData(
          color: Colors.green
        ),
      ),
    );
  }
  TextTheme _modifyDefaultTextTheme(TextTheme theme) => 
      GoogleFonts.notoSansTextTheme(theme);
}