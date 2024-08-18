import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/Colors.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/controller/login_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/checking_container.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        CarSliverAppBar(title: "تسجيل الدخول".tr),
        GetBuilder<LoginController>(
          builder: (controller) => Form(
            key: controller.formsGlobalKey,
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: index == 0 ? 20.h : 0,
                      bottom: 5.h),
                  child: CustomTextFormField(
                    textEditingController:
                        controller.formsData[index].textEditingController,
                    obscure: controller.formsData[index].isPassword,
                    validator: (p0) => controller.handleValidation(index),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                    hint: controller.formsData[index].hint,
                  ),
                ),
                childCount: controller.formsData.length,
              ),
            ),
          ),
        ),
        GetBuilder<LoginController>(
          builder: (controller) => SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "ليس لديك حساب؟ ".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.grey, fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: "أنقر هنا ".tr,
                    recognizer: controller.signUpButtonGesture,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.primaryColor, fontSize: 14.sp),
                  ),
                  TextSpan(
                    text: "للتسجيل".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.grey, fontSize: 14.sp),
                  ),
                ])),
              ),
              Align(
                //Fix On Translate
                alignment: leftRightLangAlign(controller.selectedLocal),
                child: TextButton(
                    onPressed: () =>
                        Get.toNamed(AppRoutes.forgotPassEmailPageRoute),
                    child: Text(
                      "هل نسيت كلمة المرور؟".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: AppColors.primaryColor, fontSize: 14.sp),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10).w,
                child: Hero(
                  tag: "SubmitAuth",
                  child: GetBuilder<LoginController>(
                    builder: (controller) => controller.statusRequest ==
                            StatusRequest.loading
                        ? CheckingContainer()
                        : CustomButton(
                            buttonBody: "تسجيل الدخول".tr,
                            onTap: () => controller.checkValidation(),
                            buttonColor: const Color.fromARGB(255, 4, 40, 103),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: ButtonWithIcon(
                  minWidth: AppSize.screenWidth(context),
                  title: "تسجيل الدخول مع غوغل".tr,
                  image: AppImages.googleLogo,
                  color: const Color.fromARGB(255, 6, 36, 87),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10).w,
                child: ButtonWithIcon(
                  minWidth: AppSize.screenWidth(context),
                  title: "تسجيل الدخول مع فيسبوك".tr,
                  icon: FontAwesome.facebook_brand,
                  iconTextDist: 10.w,
                  color: const Color.fromARGB(255, 1, 26, 68),
                  onPressed: () {},
                ),
              ),
            ]),
          ),
        )
      ],
    ));
  }
}
