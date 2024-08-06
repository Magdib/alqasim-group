import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/Colors.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/controller/login_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
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
        const CarSliverAppBar(title: "تسجيل الدخول"),
        GetBuilder<LoginController>(
          builder: (controller) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: index == 0 ? 20 : 0, bottom: 5),
                child: CustomTextFormField(
                  textEditingController:
                      controller.formsData[index].textEditingController,
                  obscure: controller.formsData[index].isPassword,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  hint: controller.formsData[index].hint,
                ),
              ),
              childCount: controller.formsData.length,
            ),
          ),
        ),
        GetBuilder<LoginController>(
          builder: (controller) => SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "ليس لديك حساب؟ ",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  TextSpan(
                    text: "أنقر هنا ",
                    recognizer: controller.signUpButtonGesture,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  TextSpan(
                    text: "للتسجيل",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                ])),
              ),
              Align(
                alignment: leftRightLangAlign(),
                child: TextButton(
                    onPressed: () =>
                        Get.toNamed(AppRoutes.forgotPassEmailPageRoute),
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.primaryColor,
                              ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: "SubmitAuth",
                  child: CustomButton(
                    buttonBody: "تسجيل الدخول",
                    onTap: () {},
                    buttonColor: const Color.fromARGB(255, 4, 40, 103),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ButtonWithIcon(
                  minWidth: AppSize.screenWidth(context),
                  title: "تسجيل الدخول مع غوغل",
                  image: AppImages.googleLogo,
                  color: const Color.fromARGB(255, 6, 36, 87),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ButtonWithIcon(
                  minWidth: AppSize.screenWidth(context),
                  title: "تسجيل الدخول مع فيسبوك",
                  icon: FontAwesome.facebook_brand,
                  iconTextDist: 10,
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
