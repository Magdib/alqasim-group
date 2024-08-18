import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: GetBuilder<MainPageController>(
        builder: (controller) => PageView.builder(
            itemCount: controller.sliderData.length,
            controller: controller.sliderController,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: CustomCachedNetImage(
                        imageUrl: controller.sliderData[index].backgroundImage,
                        canReDownload: false,
                        width: AppSize.screenWidth(context),
                        height: 100.h,
                        borderRadius: 8.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Text(controller.sliderData[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
