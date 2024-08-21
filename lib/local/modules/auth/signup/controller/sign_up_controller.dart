import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';
import 'package:proj/local/modules/auth/signup/data/sign_up_data.dart';

class SignUpController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signInButtonGesture;
  GlobalKey<FormState> formsGlobalKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
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
          hint: "اسم المستخدم".tr,
          validation: "لا يمكن لاسم المستخدم ان يكون فارغاً".tr,
          textEditingController: userNameController),
      FormsDataModel(
          hint: "البريد الإلكتروني".tr,
          validation: "لا يمكن للبريد الإلكتروني ان يكون فارغاً".tr,
          textEditingController: emailController),
      FormsDataModel(
          hint: "كلمة المرور".tr,
          validation: "لا يمكن لكلمة المرور أن تكون أصغر من 8 خانات".tr,
          isPassword: true,
          textEditingController: passwordController),
      FormsDataModel(
          hint: "تأكيد كلمة المرور".tr,
          validation: "كلمة المرور وتأكيدها غير متطابقان".tr,
          isPassword: true,
          textEditingController: confirmPasswordController),
    ];
    super.onInit();
  }

  String? handleValidation(int index) {
    switch (index) {
      case 0:
        if (userNameController.text.isEmpty) {
          return formsData[0].validation;
        }
        break;
      case 1:
        if (emailController.text.isEmpty) {
          return formsData[1].validation;
        }
        break;
      case 2:
        if (passwordController.text.length < 8) {
          return formsData[2].validation;
        }
        break;
      case 3:
        if (passwordController.text != confirmPasswordController.text) {
          return formsData[3].validation;
        }
        break;
    }
    return null;
  }

  checkValidation() async {
    FormState? formData = formsGlobalKey.currentState;
    if (formData!.validate()) {
      SignUpData signUpData = SignUpData(Get.find());
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.signup(
        getLanguage().languageCode,
        emailController.text,
        userNameController.text,
        passwordController.text,
        confirmPasswordController.text,
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
      }, (r) {
        statusRequest = StatusRequest.none;
        String message = r['message'];
        Get.offNamed(AppRoutes.signInPageRoute);
        AppToasts.successToast(message);

        //  else if (state ==
        //     "The email has already been taken. (and 1 more error)") {
        //   AppToasts.errorToast(
        //       "اسم المستخدم أو البريد الإلكتروني مستخدمين بالفعل".tr);
        // } else if (state == "The username has already been taken.") {
        //   AppToasts.errorToast("اسم المستخدم تم استخدامه مسبقاً".tr);
        // } else if (state == "The email has already been taken.") {
        //   AppToasts.errorToast("البريد الإلكتروني تم استخدامه مسبقاً".tr);
        // } else if (state == "The email must be a valid email address.") {
        //   AppToasts.errorToast("صيغة خاطئة للبريد الإلكتروني".tr);
        // } else {
        //   AppToasts.errorToast("حدث خطأ ما...".tr);
        // }
      });
      update();
    }
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
