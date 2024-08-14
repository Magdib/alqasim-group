import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class CarDescription extends GetView<CarDetailsController> {
  const CarDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المواصفات:".tr,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 12.5.h,
        ),
        SizedBox(
          height: 625.h,
          child: GridView.builder(
            itemCount: controller.carDetailsTitle.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 80.h,
              crossAxisSpacing: 20.w,
            ),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: controller.carDetailsTitle[index].addPadding
                      ? EdgeInsets.all(7.5).w
                      : null,
                  decoration: BoxDecoration(
                      color: AppColors.lGrey,
                      borderRadius: BorderRadius.circular(2.r)),
                  child: Icon(
                    controller.carDetailsTitle[index].icon,
                    size: controller.carDetailsTitle[index].size,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSize.screenWidth(context) / 3.5,
                      child: FittedBox(
                        alignment: leftRightLangAlign(controller.selectedLocal),
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.carDetailsTitle[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 12.sp,
                                height: 1.3,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Text(
                      controller.carDetails[index],
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.grey,
                                fontSize: 11.sp,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text("الوصف:".tr, style: Theme.of(context).textTheme.displayLarge),
        SizedBox(
          height: 10.h,
        ),
        Text(
          controller.car.description,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColors.grey, fontSize: 12.sp),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
