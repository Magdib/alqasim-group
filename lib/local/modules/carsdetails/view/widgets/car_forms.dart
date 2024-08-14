import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class CarForms extends StatelessWidget {
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
            Image.asset(
              "assets/images/logo.webp",
              width: 120.w,
              fit: BoxFit.fitWidth,
            ),
            Text(
              "admin",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "info@alqassimgroup.net",
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "الاسم".tr,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormField(
              obscure: false,
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
              numberOfLines: 5,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              hint: "رسالة...".tr,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(buttonBody: "إرسال الرسالة".tr, onTap: () {})
          ],
        ));
  }
}
