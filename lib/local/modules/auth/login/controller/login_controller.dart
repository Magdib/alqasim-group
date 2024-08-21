import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/auth/login/data/sign_in_data.dart';
import 'package:proj/local/modules/auth/shared/model/forms_data_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/login_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController emailCheckController;
  late TextEditingController otpController;
  late TextEditingController resetPassController;
  late TextEditingController confirmResetPassController;
  late List<FormsDataModel> formsData;
  late TapGestureRecognizer signUpButtonGesture;
  late String selectedLocal;
  GlobalKey<FormState> formsGlobalKey = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest googleStatusRequest = StatusRequest.none;
  StatusRequest checkEmailStatusRequest = StatusRequest.none;
  StatusRequest checkOTPStatusRequest = StatusRequest.none;
  StatusRequest passwordResetStatusRequest = StatusRequest.none;
  bool canReset = false;
  Box authBox = Hive.box(HiveBoxes.authBox);
  Box<LoginModel> loginBox = Hive.box(HiveBoxes.loginDataBox);
  String? handleValidation(int index) {
    switch (index) {
      case 0:
        if (emailController.text.isEmpty) {
          return formsData[0].validation;
        }
        break;
      case 1:
        if (passwordController.text.length < 8) {
          return formsData[1].validation;
        }
        break;
    }
    return null;
  }

  checkValidation() async {
    if (googleStatusRequest != StatusRequest.loading &&
        statusRequest != StatusRequest.loading) {
      FormState? formData = formsGlobalKey.currentState;
      if (formData!.validate()) {
        SignInData signInData = SignInData(Get.find());
        statusRequest = StatusRequest.loading;
        update();
        var response = await signInData.signIn(
          getLanguage().languageCode,
          emailController.text,
          password: passwordController.text,
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
          await loginBox.clear();
          await loginBox.add(loginData);
          authBox.put(HiveKeys.token, token);
          log("data= $data");
          AppToasts.successToast("تم تسجيل الدخول بنجاح".tr);
          MainPageController mainPageController = Get.find();
          mainPageController.handleAfterLogin();
          Get.until((route) => route.isFirst);
        });
      }
    }
  }

  signInWithGoogleRequest() async {
    if (googleStatusRequest != StatusRequest.loading &&
        statusRequest != StatusRequest.loading) {
      UserCredential? userCredential = await signInWithGoogle();
      if (userCredential != null) {
        googleStatusRequest = StatusRequest.loading;
        update();
        SignInData signInData = SignInData(Get.find());
        await Future.delayed(Duration(seconds: 5));
        var response = await signInData.signIn(
            getLanguage().languageCode, userCredential.user!.email!,
            provider: "google",
            providerId: userCredential.credential!.providerId);
        response.fold((l) {
          googleStatusRequest = StatusRequest.none;
          if (l.runtimeType == NetworkError) {
            AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
          } else {
            AppToasts.errorToast(l.message);
          }
          update();
        }, (r) async {
          Map<String, dynamic> data = r['data'];
          LoginModel loginData = LoginModel.fromJson(data);
          String token = r['token'];
          await loginBox.clear();
          await loginBox.add(loginData);
          authBox.put(HiveKeys.token, token);
          log("data= $data");
          AppToasts.successToast("تم تسجيل الدخول بنجاح".tr);
          MainPageController mainPageController = Get.find();
          mainPageController.handleAfterLogin();
          Get.until((route) => route.isFirst);
        });
        await GoogleSignIn().signOut();
      }
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      log(googleUser.toString());
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log(e.toString());
    }
  }

  checkEmail([bool withNavigation = true]) async {
    if (emailCheckController.text.length > 10) {
      checkEmailStatusRequest = StatusRequest.loading;
      update();
      SignInData signInData = SignInData(Get.find());
      var response = await signInData.checkEmail(
        getLanguage().languageCode,
        emailCheckController.text,
      );
      response.fold((l) {
        checkEmailStatusRequest = StatusRequest.none;
        if (l.runtimeType == NetworkError) {
          AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
        } else {
          AppToasts.errorToast(l.message);
        }
        update();
      }, (r) {
        if (withNavigation) {
          checkEmailStatusRequest = StatusRequest.none;
          Get.toNamed(AppRoutes.otpPageRoute);
        } else {
          AppToasts.successToast("تم إرسال رمز التحقق بنجاح".tr);
        }
      });
      update();
    } else {
      AppToasts.errorToast("الرجاء التحقق من صيغة البريد الإلكتروني".tr);
    }
  }

  checkOtp() async {
    checkOTPStatusRequest = StatusRequest.loading;
    update();
    SignInData signInData = SignInData(Get.find());
    var response = await signInData.checkOtpPassword(getLanguage().languageCode,
        emailCheckController.text, otpController.text);
    response.fold((l) {
      checkOTPStatusRequest = StatusRequest.none;
      if (l.runtimeType == NetworkError) {
        AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
      } else {
        AppToasts.errorToast(l.message);
      }
      update();
    }, (r) {
      checkOTPStatusRequest = StatusRequest.none;
      Get.toNamed(AppRoutes.resetPasswordPageRoute);
    });

    update();
  }

  resetPassword() async {
    passwordResetStatusRequest = StatusRequest.loading;
    update();
    SignInData signInData = SignInData(Get.find());
    var response = await signInData.checkOtpPassword(
        getLanguage().languageCode,
        emailCheckController.text,
        otpController.text,
        resetPassController.text);
    response.fold((l) {
      passwordResetStatusRequest = StatusRequest.none;
      if (l.runtimeType == NetworkError) {
        AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
      } else {
        AppToasts.errorToast(l.message);
      }
      update();
    }, (r) {
      passwordResetStatusRequest = StatusRequest.none;
      update();
      Get.offNamedUntil(
        AppRoutes.signInPageRoute,
        (route) => route.isFirst,
      );
      emailCheckController.clear();
      otpController.clear();
      resetPassController.clear();
      confirmResetPassController.clear();
      AppToasts.successToast("تمت إعادة تعيين كلمة المرور بنجاح".tr);
    });
  }

  checkResetPassword() {
    if (resetPassController.text.length >= 8 &&
        resetPassController.text == confirmResetPassController.text) {
      canReset = true;
      update();
    } else {
      if (canReset != false) {
        canReset = false;
        update();
      }
    }
  }

  @override
  void onInit() {
    selectedLocal =
        hiveNullGet(HiveKeys.language, Get.deviceLocale!.languageCode);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailCheckController = TextEditingController();
    resetPassController = TextEditingController();
    confirmResetPassController = TextEditingController();
    otpController = TextEditingController();
    signUpButtonGesture = TapGestureRecognizer()
      ..onTap = () => Get.offNamed(AppRoutes.signUpPageRoute);
    formsData = [
      FormsDataModel(
          hint: "البريد الإلكتروني".tr,
          validation: "لا يمكن للبريد الإلكتروني ان يكون فارغاً".tr,
          textEditingController: emailController),
      FormsDataModel(
          hint: "كلمة المرور".tr,
          validation: "لا يمكن لكلمة المرور أن تكون أصغر من 8 خانات".tr,
          isPassword: true,
          textEditingController: passwordController),
    ];
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    signUpButtonGesture.dispose();
    emailCheckController.dispose();
    otpController.dispose();
    resetPassController.dispose();
    confirmResetPassController.dispose();
    loginBox.close();
    super.dispose();
  }
}
