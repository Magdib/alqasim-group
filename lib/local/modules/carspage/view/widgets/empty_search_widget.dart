import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

class EmptySearchWidget extends StatelessWidget {
  const EmptySearchWidget({
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
            height: AppSize.screenHight(context) / 6,
          ),
          Icon(
            Icons.search,
            size: 120.r,
            color: AppColors.primaryColor,
          ),
          Text(
            "قم بالبحث عن خصائص سيارة لعرضها".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
