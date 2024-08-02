import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    surfaceTintColor: AppColors.white,
    elevation: 10,
    shadowColor: AppColors.black,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Image.asset(
          "assets/images/logo2.webp",
          width: AppSize.screenWidth(context) / 2,
          fit: BoxFit.fitWidth,
          color: AppColors.primaryColor,
        ),
      ),
    ],
    toolbarHeight: 60,
    backgroundColor: AppColors.white,
  );
}
