import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color light = Color(0xFFF7F8FC);
const Color gray = Color(0xFFA4A6B3);
const Color dark = Color(0xFF3B3B3B);

Color getBackgroundColor({Brightness? brightness}) =>
    (brightness ?? Get.theme.brightness) == Brightness.light ? light : dark;
Color getOnBackgroundColor({Brightness? brightness}) =>
    (brightness ?? Get.theme.brightness) == Brightness.dark ? light : dark;
