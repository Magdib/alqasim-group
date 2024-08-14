import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';

class AlQassemLogoCard extends StatelessWidget {
  const AlQassemLogoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: AppColors.lGreyD),
      child: Image.asset(
        AppImages.logo,
        height: 40.h,
        fit: BoxFit.fitHeight,
        color: AppColors.primaryColor,
      ),
    );
  }
}
