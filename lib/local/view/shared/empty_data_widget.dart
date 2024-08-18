import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.screenHight(context) - 150.h,
      width: AppSize.screenWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppSize.screenHight(context) / 8,
          ),
          Image.asset(
            AppImages.carOffImage,
            width: AppSize.screenWidth(context) / 3,
            color: AppColors.primaryColor,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "لا يوجد سيارات لعرضها".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
