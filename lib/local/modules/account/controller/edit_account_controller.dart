import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/modules/auth/login/model/login_model.dart';

class EditAccountController extends GetxController {
  late TextEditingController userNameController;
  late TextEditingController locationController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  Box<LoginModel> loginDataBox = Hive.box(HiveBoxes.loginDataBox);
  late LoginModel loginData;
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
