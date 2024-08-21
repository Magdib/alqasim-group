import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

import '../widgets/icon_title_row.dart';

class CarCards extends GetView<CarDetailsController> {
  const CarCards({
    super.key,
    required this.cars,
  });
  final List<RelatedCars> cars;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
          ? 370.h
          : 350,
      child: PageView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.changeToLinkedCar(index),
          child: Container(
            width: AppSize.screenWidth(context),
            margin: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            height: 320.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    width: AppSize.screenWidth(context),
                    height: 140.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: CustomCachedNetImage(
                      imageUrl: cars[index].featureImage,
                      canReDownload: false,
                      fit: BoxFit.fitWidth,
                      borderRadius: 8.r,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "${cars[index].brand} ${cars[index].model}",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  color: AppColors.grey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        cars[index].productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        height: 7.5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomCachedNetImage(
                            imageUrl: cars[index].vendor.photo,
                            canReDownload: false,
                            height: AppSize.screenWidth(context) >=
                                    AppSize.tabletBreakPoint
                                ? 40.h
                                : 25.h,
                            width: AppSize.screenWidth(context) >=
                                    AppSize.tabletBreakPoint
                                ? 30.w
                                : 25.w,
                            borderRadius: AppSize.screenWidth(context) >=
                                    AppSize.tabletBreakPoint
                                ? 40.r
                                : 25.r,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          IconTitleRow(
                            icon: AppStatics.carCardIcons[0],
                            text: cars[index].year,
                            index: 0,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          IconTitleRow(
                            icon: AppStatics.carCardIcons[1],
                            text: cars[index].mileage,
                            index: 1,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          IconTitleRow(
                            icon: AppStatics.carCardIcons[2],
                            text: "${cars[index].speed}",
                            index: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        cars[index].symbolPrice,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
