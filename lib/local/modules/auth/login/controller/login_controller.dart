import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/functions/hive_null_get.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/data/sign_in_data.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

import '../model/login_model.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signUpButtonGesture;
  late String selectedLocal;
  GlobalKey<FormState> formsGlobalKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  Box authBox = Hive.box(HiveBoxes.authBox);
  Box<LoginModel> loginBox = Hive.box(HiveBoxes.loginDataBox);
  @override
  void onInit() {
    selectedLocal =
        hiveNullGet(HiveKeys.language, Get.deviceLocale!.languageCode);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signUpButtonGesture = TapGestureRecognizer()
      ..onTap = () => Get.offNamed(AppRoutes.signUpPageRoute);
    formsData = [
      FormsDataModel(
          hint: "البريد الإلكتروني".tr,
          validation: "لا يمكن للبريد الإلكتروني ان يكون فارغاً".tr,
          textEditingController: emailController),
      FormsDataModel(
          hint: "كلمة المرور".tr,
          validation: "لا يمكن لكلمة المرور أن تكون أصغر من 6 خانات".tr,
          isPassword: true,
          textEditingController: passwordController),
    ];
    super.onInit();
  }

  String? handleValidation(int index) {
    switch (index) {
      case 0:
        if (emailController.text.isEmpty) {
          return formsData[0].validation;
        }
        break;
      case 1:
        if (passwordController.text.length < 6) {
          return formsData[1].validation;
        }
        break;
    }
    return null;
  }

  checkValidation() async {
    FormState? formData = formsGlobalKey.currentState;
    if (formData!.validate()) {
      SignInData signInData = SignInData(Get.find());
      statusRequest = StatusRequest.loading;
      update();
      var response = await signInData.signIn(
        emailController.text,
        passwordController.text,
      );
      response.fold((l) {
        if (l.runtimeType == NetworkError) {
          statusRequest = StatusRequest.offlineFailure;
          AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
        } else {
          statusRequest = StatusRequest.failure;
          AppToasts.errorToast(l.message);
        }
        update();
      }, (r) async {
        statusRequest = StatusRequest.none;
        Map<String, dynamic> data = r['data'];
        LoginModel loginData = LoginModel.fromJson(data);
        String token = r['token'];
        loginBox.clear();
        loginBox.add(loginData);
        authBox.put(HiveKeys.token, token);
        log("data= $data");
        AppToasts.successToast("تم تسجيل الدخول بنجاح");
        MainPageController mainPageController = Get.find();
        mainPageController.handleAfterLogin();
        Get.until((route) => route.isFirst);
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    signUpButtonGesture.dispose();
    loginBox.close();
    super.dispose();
  }
}
