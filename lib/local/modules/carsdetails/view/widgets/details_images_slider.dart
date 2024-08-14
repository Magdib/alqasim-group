import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class DetailsImagesSlider extends StatelessWidget {
  const DetailsImagesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
      builder: (controller) => SizedBox(
        height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
            ? 250.h
            : 200,
        width: AppSize.screenWidth(context),
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: controller.car.images.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
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
