import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Colors.dart';
import 'app_size.dart';

TextStyle primaryTextStyle(
    {required bool isUnderLine, required BuildContext context}) {
  return Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppColors.primaryColor,
        decoration: isUnderLine == true
            ? TextDecoration.underline
            : TextDecoration.none,
      );
}

TextStyle buttonTextStyle({required BuildContext context}) {
  return Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppColors.white,
        fontSize: 15,
      );
}

TextStyle textFormStyle({required BuildContext context}) {
  return Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppColors.black,
        fontSize: AppSize.screenWidth >= AppSize.tabletBreakPoint
            ? 13
            // .sp
            : 15,
      );
}

TextStyle appBarStyle({required BuildContext context}) {
  return Theme.of(context).textTheme.displayLarge!.copyWith(
        color: AppColors.black,
        fontSize: 15,
      );
}
