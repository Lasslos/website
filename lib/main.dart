import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/page_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Laslo Hauschild',
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
      textTheme: GoogleFonts.mulishTextTheme(
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