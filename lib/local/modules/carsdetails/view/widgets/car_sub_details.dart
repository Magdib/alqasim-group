import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/modules/carsdetails/data/enums/save_images_state.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

import 'contact_vendor_row.dart';

class CarSubDetails extends GetView<CarDetailsController> {
  const CarSubDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.car.category,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text("${controller.car.brand} ${controller.car.model}",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16.sp)),
            SizedBox(
              height: 7.5.h,
            ),
            Text(controller.car.symbolPrice,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    )),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.sellerCarsPageRoute),
                child: CustomCachedNetImage(
                  imageUrl: controller.car.vendor.photo,
                  canReDownload: false,
                  height: 30.h,
                  width: 30.w,
                  borderRadius: 16.r,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 15.h,
            ),
            ContactVendorRow(),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
        GetBuilder<CarDetailsController>(
            builder: (controller) =>
                controller.saveImagesState != SaveImagesState.saved
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                        child: Column(
                          children: [
                            MaterialButton(
                              minWidth: 50.w,
                              onPressed: controller.saveImagesState ==
                                      SaveImagesState.notSaved
                                  ? () => controller.saveImages()
                                  : () {},
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 0),
                              color: AppColors.lGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppSize.appCustomRadius.r)),
                              child: controller.saveImagesState ==
                                      SaveImagesState.notSaved
                                  ? Icon(
                                      Icons.save_alt_rounded,
                                      color: AppColors.primaryColor,
                                    )
                                  : SpinKitFadingCircle(
                                      color: AppColors.primaryColor,
                                      size: 24.r,
                                    ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (controller.saveImagesState ==
                                SaveImagesState.notSaved)
                              Text(
                                "حفظ".tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal),
                              )
                          ],
                        ),
                      )
                    : const SizedBox())
      ],
    );
  }
}
