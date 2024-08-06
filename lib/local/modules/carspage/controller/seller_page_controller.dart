import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class SellerPageController extends GetxController {
  List<String> fixedTabBarItems = [
    "جميع السيارات",
    "قابلة للتحويل",
    "دفع رباعي",
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

  List<CarModel> sellerCars = [
    CarModel(
        image: "assets/images/car1.webp",
        price: "5844480AED",
        type: "بينتلي 2020",
        name: "Bentley Bentayga Speed",
        user: "admin",
        date: "2020",
        meters: "51,402",
        speed: 306),
    CarModel(
        image: "assets/images/car2.webp",
        price: "234,500 AED",
        type: "بينتلي 2020",
        name: "Bentley",
        user: "admin",
        date: "2020",
        meters: "4,402",
        speed: 280),
  ];
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
