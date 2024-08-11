import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/functions/hive_null_get.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';

class LoginController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signUpButtonGesture;
  late String selectedLocal;
  @override
  void onInit() {
    selectedLocal =
        hiveNullGet(HiveKeys.language, Get.deviceLocale!.languageCode);
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    signUpButtonGesture = TapGestureRecognizer()
      ..onTap = () => Get.offNamed(AppRoutes.signUpPageRoute);
    formsData = [
      FormsDataModel(
          hint: "اسم المستخدم".tr, textEditingController: userNameController),
      FormsDataModel(
          hint: "كلمة المرور".tr,
          isPassword: true,
          textEditingController: passwordController),
    ];
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    signUpButtonGesture.dispose();
    super.dispose();
  }
}
