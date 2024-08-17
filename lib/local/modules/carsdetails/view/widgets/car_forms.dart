import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class CarForms extends GetView<CarDetailsController> {
  const CarForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10).w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.white,
            boxShadow: [BoxShadow(color: AppColors.lBlack, blurRadius: 4.r)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCachedNetImage(
              imageUrl: controller.car.vendor.photo,
              height: 80.h,
              width: 90.w,
              canReDownload: false,
              fit: BoxFit.cover,
              borderRadius: 60.r,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              controller.car.vendor.username,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              controller.car.vendor.email,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              obscure: false,
              textEditingController: controller.userNameController,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "الاسم".tr,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              obscure: false,
              textEditingController: controller.emailController,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "عنوان البريد الإلكتروني".tr,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              obscure: false,
              textEditingController: controller.phoneNumController,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "رقم الهاتف".tr,
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              obscure: false,
              textEditingController: controller.messageController,
              numberOfLines: 5,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "رسالة...".tr,
            ),
            SizedBox(
              height: 15.h,
            ),
            GetBuilder<CarDetailsController>(
              builder: (controller) => controller.emailStatusRequest ==
                      StatusRequest.loading
                  ? Container(
                      height: 50,
                      width: AppSize.screenWidth(context) * 0.8,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSize.appCustomRadius.r),
                          color: AppColors.primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "جارٍ الإرسال".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          SpinKitDualRing(
                            color: AppColors.white,
                            size: 20.r,
                          ),
                        ],
                      ),
                    )
                  : CustomButton(
                      buttonBody: "إرسال الرسالة".tr,
                      onTap: () => controller.sendEmail()),
            )
          ],
        ));
  }
}
