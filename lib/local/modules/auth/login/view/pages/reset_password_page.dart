import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/controller/login_controller.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        CarSliverAppBar(title: "إعادة تعيين كلمة المرور".tr),
        GetBuilder<LoginController>(
            builder: (controller) => SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    child: Text(
                      "كلمة المرور الجديدة:".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: CustomTextFormField(
                      hint: "أدخل كلمة المرور الجديدة هنا...".tr,
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    child: Text(
                      "تأكيد كلمة المرور:".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: CustomTextFormField(
                      hint: "أعد إدخال كلمة المرور الجديدة هنا...".tr,
                      obscure: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.screenWidth(context) / 4),
                    child: ButtonWithIcon(
                      title: "إعادة التعيين".tr,
                      icon: MingCute.key_2_line,
                      iconSize: 28,
                      reverse: true,
                      onPressed: () => Get.offNamedUntil(
                        AppRoutes.signInPageRoute,
                        (route) => route.isFirst,
                      ),
                    ),
                  )
                ])))
      ]),
    );
  }
}
