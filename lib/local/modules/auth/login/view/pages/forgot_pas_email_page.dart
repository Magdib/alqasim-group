import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class ForgotPassEmailPage extends StatelessWidget {
  const ForgotPassEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        CarSliverAppBar(title: "التحقق من الحساب".tr),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 80.h,
          ),
          Image.asset(
            AppImages.otpFImage,
            height: 120.h,
            width: 60.w,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "التحقق من الحساب".tr,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.primaryColor, fontSize: 18.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "الرجاء إدخال الحساب المراد استعادة كلمة المرور له في الحقل التالي:"
                  .tr,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: AppColors.grey, height: 1.5),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomTextFormField(
              hint: "أدخل الحساب هنا من فضلك...".tr,
              textAlign: TextAlign.center,
              inputType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.screenWidth(context) / 4),
            child: ButtonWithIcon(
                title: "إرسال الرمز ".tr,
                icon: MingCute.telegram_line,
                onPressed: () => Get.toNamed(AppRoutes.otpPageRoute)),
          ),
          SizedBox(
            height: 40.h,
          )
        ]))
      ],
    ));
  }
}
