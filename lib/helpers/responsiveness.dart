import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  static bool isLargeScreenSize() => isScreenSize(largeScreenSize, double.infinity);
  static bool isMediumScreenSize() => isScreenSize(mediumScreenSize, largeScreenSize);
  static bool isSmallScreenSize() => isScreenSize(double.negativeInfinity, mediumScreenSize);

  static bool isScreenSize(double lowerBound, double upperBound) {
    assert(upperBound > lowerBound);
    var screenSize = Get.mediaQuery.size.width;
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
