import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const CustomText(this.text, {this.size, this.color, this.weight, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(fontSize: size ?? 16, color: color ?? Colors.black, fontWeight: weight ?? FontWeight.normal),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}