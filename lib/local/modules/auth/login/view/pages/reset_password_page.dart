import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/controller/login_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/checking_container.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class ResetPasswordPage extends GetView<LoginController> {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        CarSliverAppBar(title: "إعادة تعيين كلمة المرور".tr),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
            child: Text(
              "كلمة المرور الجديدة:".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: CustomTextFormField(
              hint: "أدخل كلمة المرور الجديدة هنا...".tr,
              textEditingController: controller.resetPassController,
              onChange: (p0) => controller.checkResetPassword(),
              obscure: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
            child: Text(
              "تأكيد كلمة المرور:".tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 14.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: CustomTextFormField(
                hint: "أعد إدخال كلمة المرور الجديدة هنا...".tr,
                obscure: true,
                onChange: (p0) => controller.checkResetPassword(),
                textEditingController: controller.confirmResetPassController),
          ),
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<LoginController>(
            builder: (controller) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.screenWidth(context) / 4),
              child:
                  controller.passwordResetStatusRequest == StatusRequest.loading
                      ? const CheckingContainer()
                      : ButtonWithIcon(
                          title: "إعادة التعيين".tr,
                          icon: MingCute.key_2_line,
                          iconSize: 28.r,
                          reverse: true,
                          onPressed: controller.canReset
                              ? () => controller.resetPassword()
                              : null),
            ),
          )
        ]))
      ]),
    );
  }
}
