import 'package:flutter/material.dart';

const double largeScreenSize = 1366;
const double mediumScreenSize = 768;
const double smallScreenSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeSizedWidget;
  final Widget? mediumSizedWidget;
  final Widget? smallSizedWidget;

  const ResponsiveWidget({
    required this.largeSizedWidget,
    this.mediumSizedWidget,
    this.smallSizedWidget,
  });

  static bool isLargeScreenSize(BuildContext context) => isScreenSize(context, largeScreenSize, double.infinity);
  static bool isMediumScreenSize(BuildContext context) => isScreenSize(context, mediumScreenSize, largeScreenSize);
  static bool isSmallScreenSize(BuildContext context) => isScreenSize(context, double.negativeInfinity, mediumScreenSize);

  static bool isScreenSize(BuildContext context, double lowerBound, double upperBound) {
    assert(upperBound > lowerBound);
    var screenSize = MediaQuery.of(context).size.width;
    return screenSize >= lowerBound && screenSize < upperBound;
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, constrains) {
    var _width = MediaQuery.of(context).size.width;
    if (_width >= largeScreenSize) {
      return largeSizedWidget;
    }
    if (_width >= mediumScreenSize) {
      return mediumSizedWidget ?? largeSizedWidget;
    }
    return smallSizedWidget ?? mediumSizedWidget ?? largeSizedWidget;
  });
}
