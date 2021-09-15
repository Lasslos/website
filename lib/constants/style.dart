import 'package:flutter/material.dart';

const Color light = Color(0xFFF7F8FC);
const Color gray = Color(0xFFA4A6B3);
const Color dark = Color(0xFF3B3B3B);

Color getBackgroundColor(Brightness brightness) =>
    brightness == Brightness.light ? light : dark;
Color getOnBackgroundColor(Brightness brightness) =>
    brightness == Brightness.dark ? light : dark;