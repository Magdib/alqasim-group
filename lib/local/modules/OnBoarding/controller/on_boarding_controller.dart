import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/routes/routes.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int index = 0;
  late Box authBox;
  moveToNextPage() {
    if (index < 1) {
      pageController.nextPage(
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.easeIn);
    } else {
      Get.offAllNamed(AppRoutes.homePageRoute);
      authBox.put(HiveKeys.startState, "1");
    }
    index = pageController.page!.toInt();
  }

  onPageChanged(int value) {
    index = value - 1;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() async {
    authBox = await Hive.openBox(HiveBoxes.authBox);
    super.onReady();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
