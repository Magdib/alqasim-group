import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';

customBottomSheet(
    {double? height, Color? backGroundColor, double? radius, Widget? child}) {
  Get.bottomSheet(
    Container(
        padding: const EdgeInsets.all(20),
        height: height ?? 180,
        decoration: BoxDecoration(
            color: backGroundColor ?? AppColors.white,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(radius ?? 25))),
        child: child),
  );
}
