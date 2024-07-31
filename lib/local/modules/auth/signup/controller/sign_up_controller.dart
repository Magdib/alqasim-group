import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';

class SignUpController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signInButtonGesture;
  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    signInButtonGesture = TapGestureRecognizer()
      ..onTap = () => Get.offNamed(AppRoutes.signInPageRoute);
    formsData = [
      FormsDataModel(
          hint: "اسم المستخدم", textEditingController: userNameController),
      FormsDataModel(
          hint: "البريد الإلكتروني", textEditingController: emailController),
      FormsDataModel(
          hint: "كلمة المرور",
          isPassword: true,
          textEditingController: passwordController),
      FormsDataModel(
          hint: "تأكيد كلمة المرور",
          isPassword: true,
          textEditingController: confirmPasswordController),
    ];
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    signInButtonGesture.dispose();
    super.dispose();
  }
}
