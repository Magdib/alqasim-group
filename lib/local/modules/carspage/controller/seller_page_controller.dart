import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class SellerPageController extends GetxController {
  List<String> fixedTabBarItems = [
    "جميع السيارات",
    "قابلة للتحويل",
  ];
  late PageController pageController;
  int selectedIndex = 0;
  changeTabView(int index, bool changedWithButton) {
    if (changedWithButton) {
      if (selectedIndex == index + 1 || selectedIndex == index - 1) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    } else {
      pageController.jumpToPage(
        index,
      );
    }
    selectedIndex = index;
    update();
  }

  List<CarModel> sellerCars = [];
  @override
  void onInit() {
    pageController = PageController();
    CarDetailsController carDetailsController = Get.find();
    sellerCars.add(carDetailsController.car);
    sellerCars.add(carDetailsController.car);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
