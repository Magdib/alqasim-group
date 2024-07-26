import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(GetPlatform.isAndroid
          ? Icons.arrow_back_rounded
          : Icons.arrow_back_ios_rounded),
      color: color ?? AppColors.secondaryColor,
    );
  }
}
