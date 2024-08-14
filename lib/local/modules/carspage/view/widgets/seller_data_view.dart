import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

import 'custom_text_row.dart';

class SellerDataView extends StatelessWidget {
  const SellerDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10).w,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
          boxShadow: [BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)]),
      child: Column(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.appCustomRadius.r),
                image: const DecorationImage(
                    image: AssetImage(AppImages.adminImage),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text("Admin", style: Theme.of(context).textTheme.displayLarge!),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Amjad",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          SizedBox(
            height: 5.h,
          ),
          const CustomHorizontalDivider(),
          SizedBox(
            height: 5.h,
          ),
          CustomTextRow(
            title: "مجموع السيارات:".tr,
            trailing: "2",
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomTextRow(
            title: "عنوان:".tr,
            trailing: "Sharjah - UAE",
          ),
          SizedBox(
            height: 5.h,
          ),
          const CustomHorizontalDivider(),
        ],
      ),
    );
  }
}
