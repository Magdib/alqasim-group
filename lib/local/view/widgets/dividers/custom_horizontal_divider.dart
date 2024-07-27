import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider(
      {super.key,
      this.color,
      this.thickness,
      this.height,
      this.rightPadding,
      this.leftPadding});
  final Color? color;
  final double? thickness;
  final double? height;
  final double? rightPadding;
  final double? leftPadding;
  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: leftPadding,
      endIndent: rightPadding,
      height: height,
      color: color ?? const Color.fromARGB(255, 228, 229, 231),
      thickness: thickness,
    );
  }
}
