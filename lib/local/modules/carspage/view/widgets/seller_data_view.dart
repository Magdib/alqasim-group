import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';
import 'package:proj/local/modules/carspage/model/api/seller_model.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

import 'custom_text_row.dart';

class SellerDataView extends GetView<SellerPageController> {
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
            child: CustomCachedNetImage(
              imageUrl: controller.vendorData.runtimeType == AdminVendor
                  ? controller.vendorData.image
                  : controller.vendorData.photo,
              canReDownload: false,
              height: 100.h,
              width: 100.w,
              borderRadius: AppSize.appCustomRadius.r,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
              controller.vendorData.runtimeType == AdminVendor
                  ? controller.vendorData.firstName
                  : controller.vendorData.username,
              style: Theme.of(context).textTheme.displayLarge!),
          SizedBox(
            height: 5.h,
          ),
          Text(
            controller.vendorData.runtimeType == AdminVendor
                ? controller.vendorData.username
                : controller.vendorData.email,
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
            trailing: controller.vendorData.runtimeType == AdminVendor
                ? "${controller.sellerResponseData.totalCarsCount}"
                : "${controller.vendorData.totalCars}",
          ),
          SizedBox(
            height: 12.h,
          ),
          CustomTextRow(
            title: "عنوان:".tr,
            trailing: controller.vendorData.runtimeType == AdminVendor
                ? "${controller.vendorData.address}"
                : "${controller.sellerResponseData.vendorInfo!.address}",
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
