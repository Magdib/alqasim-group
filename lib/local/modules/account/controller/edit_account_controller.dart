import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAccountController extends GetxController {
  late TextEditingController userNameController;
  @override
  void onInit() {
    userNameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
}
