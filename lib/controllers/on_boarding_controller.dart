import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/routes/routes.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int index = 0;

  moveToNextPage() {
    index < 1
        ? pageController.nextPage(
            duration: const Duration(
              seconds: 1,
            ),
            curve: Curves.easeIn)
        : Get.toNamed(AppRoutes.signInPageRoute);
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
