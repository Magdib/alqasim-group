import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/auth/signup/controller/sign_up_controller.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        const CarSliverAppBar(title: "اشتراك"),
        GetBuilder<SignUpController>(
          builder: (controller) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: index == 0 ? 20 : 10,
                ),
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
        GetBuilder<SignUpController>(
          builder: (controller) => SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 5),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "هل لديك حساب؟ ",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                  TextSpan(
                    text: "أنقر هنا ",
                    recognizer: controller.signInButtonGesture,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  TextSpan(
                    text: "لتسجيل الدخول",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                  ),
                ])),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: "SubmitAuth",
                  child: CustomButton(
                    buttonBody: "اشتراك",
                    onTap: () {},
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
