import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/account/data/account_data.dart';
import 'package:proj/local/modules/auth/login/model/login_model.dart';
import 'package:flutter_device_id/flutter_device_id.dart';
// import 'package:device_info_plus/device_info_plus.dart';

class EditAccountController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController locationController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  StatusRequest statusRequest = StatusRequest.none;
  Box<LoginModel> loginDataBox = Hive.box(HiveBoxes.loginDataBox);
  late LoginModel loginData;
  String token = Hive.box(HiveBoxes.authBox).get(HiveKeys.token);
  updateProfile() async {
    if (userNameController.text == loginData.username &&
        locationController.text == loginData.address &&
        phoneNumberController.text == loginData.phone &&
        passwordController.text == confirmPasswordController.text) {
      AppToasts.errorToast("البيانات مطابقة للبيانات القديمة".tr);
    } else {
      if (passwordController.text.isNotEmpty) {
        if (phoneNumberController.text.isNotEmpty &&
            phoneNumberController.text.length < 9) {
          AppToasts.errorToast("الرجاء إدخال رقم هاتف صحيح".tr);
        } else {
          statusRequest = StatusRequest.loading;
          update();
          AccountData supportTicketData = AccountData(Get.find());
          var response = await supportTicketData.updateUserProfile(
              getLanguage().languageCode,
              passwordController.text,
              token,
              confirmPasswordController.text,
              locationController.text,
              phoneNumberController.text,
              userNameController.text);
          response.fold((tl) {
            statusRequest = StatusRequest.none;
            update();
            AppToasts.errorToast(tl.message);
          }, (tr) async {
            statusRequest = StatusRequest.none;
            update();
            loginData = LoginModel(
                id: loginData.id,
                name: userNameController.text,
                username: userNameController.text,
                email: loginData.email,
                image: loginData.image,
                status: loginData.status,
                provider: loginData.provider,
                providerId: loginData.providerId,
                phone: phoneNumberController.text,
                country: loginData.country,
                city: loginData.city,
                state: loginData.state,
                zipCode: loginData.zipCode,
                address: locationController.text);
            await loginDataBox.clear();
            loginDataBox.add(loginData);
            AccountController accountController = Get.find();
            accountController.loginData = loginData;
            accountController.update();
            AppToasts.successToast(tr['message']);
            Get.back();
          });
        }
      } else {
        AppToasts.errorToast("الرجاء ملئ الحقول المطلوبة".tr);
      }
    }
  }

  @override
  void onInit() {
    loginData = loginDataBox.getAt(0)!;
    userNameController = TextEditingController(text: loginData.username);
    locationController = TextEditingController(text: loginData.address);
    phoneNumberController = TextEditingController(text: loginData.phone);
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
