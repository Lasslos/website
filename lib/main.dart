import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrouter/vrouter.dart';
import 'package:website/constants/style.dart' as style;
import 'package:website/routing/my_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => VRouter(
        debugShowCheckedModeBanner: false,
        title: 'Canada - Laslo Hauschild',
        theme: _buildTheme(Brightness.light),
        darkTheme: _buildTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        routes: myRoutes,
      );

  ThemeData _buildTheme(Brightness brightness) {
    var brightnessColor = style.getBackgroundColor(brightness: brightness);
    var antiBrightnessColor = style.getOnBackgroundColor(brightness: brightness);
    var systemUiOverlayStyle = brightness == Brightness.light
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return ThemeData(
      brightness: brightness,
      primarySwatch: Colors.green,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        primaryColorDark: Colors.green,
        accentColor: Colors.redAccent,
        brightness: brightness,
        backgroundColor: brightnessColor,
      ),
      textTheme: GoogleFonts.notoSansTextTheme(const TextTheme()),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: systemUiOverlayStyle,
        backgroundColor: brightnessColor,
        foregroundColor: antiBrightnessColor,
        toolbarTextStyle: const TextStyle(color: style.gray),
        titleTextStyle: const TextStyle(),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
    );
  }
}
