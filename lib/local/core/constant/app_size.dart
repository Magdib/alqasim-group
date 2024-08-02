import 'package:flutter/material.dart';

class AppSize {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static const double appCustomPadding = 20.0;
  static const double appCustomRadius = 8;
  static const int tabletBreakPoint = 800;
}
