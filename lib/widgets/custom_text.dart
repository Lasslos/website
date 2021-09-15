import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final bool selectable;

  const CustomText(this.text, {this.size, this.color, this.weight, this.textAlign, this.selectable = true});

  @override
  Widget build(BuildContext context) {
    return selectable ? SelectableText(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
      textAlign: textAlign ?? TextAlign.center,
    ) : Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
      textAlign: textAlign,
    );
  }
}