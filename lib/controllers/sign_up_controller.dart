import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormsDataModel {
  final String hint;
  final TextEditingController textEditingController;
  final bool isPassword;
  FormsDataModel(
      {required this.hint,
      this.isPassword = false,
      required this.textEditingController});
}

class SignUpController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signInButton;
  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    signInButton = TapGestureRecognizer()..onTap;
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
}
