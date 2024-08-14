import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class DetailsSelectableSlider extends GetView<CarDetailsController> {
  const DetailsSelectableSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          AppSize.screenWidth(context) >= AppSize.tabletBreakPoint ? 100.h : 80,
      width: AppSize.screenWidth(context),
      child: ListView.builder(
        itemCount: controller.car.images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.changeImage(index),
          child: Container(
            height: 60.h,
            width: 120.w,
            margin: EdgeInsets.symmetric(horizontal: 7.5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: CustomCachedNetImage(
              imageUrl: controller.car.images[index].image,
              canReDownload: false,
              fit: BoxFit.cover,
              borderRadius: 8.r,
            ),
          ),
        ),
      ),
    );
  }
}
