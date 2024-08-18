import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

class CheckingContainer extends StatelessWidget {
  const CheckingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: AppSize.screenWidth(context) * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.appCustomRadius.r),
          color: AppColors.primaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "جارٍ التحقق".tr,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
          ),
          SizedBox(
            width: 15.w,
          ),
          SpinKitDualRing(
            color: AppColors.white,
            size: 20.r,
          ),
        ],
      ),
    );
  }
}
