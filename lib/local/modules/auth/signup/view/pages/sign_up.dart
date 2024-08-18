import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/checking_container.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        CarSliverAppBar(title: "اشتراك".tr),
        GetBuilder<SignUpController>(
          builder: (controller) => Form(
            key: controller.formsGlobalKey,
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: index == 0 ? 20.h : 10.h,
                  ),
                  child: CustomTextFormField(
                    textEditingController:
                        controller.formsData[index].textEditingController,
                    obscure: controller.formsData[index].isPassword,
                    validator: (p0) => controller.handleValidation(index),
                    hint: controller.formsData[index].hint,
                  ),
                ),
                childCount: controller.formsData.length,
              ),
            ),
          ),
        ),
        GetBuilder<SignUpController>(
          builder: (controller) => SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 10.h, top: 5.h),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "هل لديك حساب؟ ".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.grey, fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: "أنقر هنا ".tr,
                    recognizer: controller.signInButtonGesture,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primaryColor, fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: "لتسجيل الدخول".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.grey, fontSize: 14.sp),
                  ),
                ])),
              ),
              GetBuilder<SignUpController>(
                builder: (controller) => Padding(
                  padding: EdgeInsets.all(10).w,
                  child: Hero(
                    tag: "SubmitAuth",
                    child: controller.statusRequest == StatusRequest.loading
                        ? CheckingContainer()
                        : CustomButton(
                            buttonBody: "اشتراك".tr,
                            onTap: () => controller.checkValidation(),
                          ),
                  ),
                ),
              ),
            ]),
          ),
        )
      ],
    ));
  }
}
