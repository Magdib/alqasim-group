import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Constant/Colors.dart';

TextStyle displaySmallLight() {
  return TextStyle(
      color: AppColors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "DroidArabicKufi");
}

TextStyle displayMediumLight() {
  return TextStyle(
      color: AppColors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: "DroidArabicKufi");
}

TextStyle displayLargeLight() {
  return TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "DroidArabicKufi");
}
