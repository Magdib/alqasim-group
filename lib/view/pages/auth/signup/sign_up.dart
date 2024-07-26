import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/controllers/sign_up_controller.dart';
import 'package:proj/core/constant/colors.dart';
import 'package:proj/core/routes/routes.dart';
import 'package:proj/view/widgets/buttons/custom_button.dart';
import 'package:proj/view/widgets/fields/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text(
                "اشتراك",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Schyler"),
              ),
              background: Image.asset(
                "assets/images/sliver.webp",
                fit: BoxFit.cover,
              )),
          expandedHeight: 150,
          collapsedHeight: 60,
          backgroundColor: AppColors.primaryColor,
          leading: const SizedBox(),
        ),
        GetBuilder<SignUpController>(
          builder: (controller) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: index == 0 ? 20 : 10, bottom: 10),
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
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: "هل لديك حساب؟ ",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15,
                        fontFamily: "Schyler"),
                  ),
                  TextSpan(
                    text: "أنقر هنا ",
                    recognizer: controller.signInButton,
                    style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontFamily: "Schyler"),
                  ),
                  const TextSpan(
                    text: "لتسجيل الدخول",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15,
                        fontFamily: "Schyler"),
                  ),
                ])),
              ),
              childCount: 1,
            ),
          ),
        ),
        GetBuilder<SignUpController>(
          builder: (controller) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: CustomButton(
                  buttonBody: "اشتراك",
                  onTap: () => Get.toNamed(AppRoutes.homePageRoute),
                ),
              ),
              childCount: 1,
            ),
          ),
        )
      ],
    ));
  }
}
