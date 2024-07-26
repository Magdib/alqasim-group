import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:proj/local/modules/carspage/cars_page.dart';
import 'package:proj/local/modules/favoritepage/favorite_page.dart';
import 'package:proj/local/modules/home/view/pages/home_page.dart';
import 'package:proj/local/modules/settings/settings_page.dart';

class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});
}

class TopCarsModel {
  final String image;
  final String price;
  final String type;
  final String name;
  final String user;
  bool isFav;
  TopCarsModel(
      {required this.image,
      required this.price,
      required this.type,
      required this.name,
      required this.user,
      this.isFav = false});
}

class MainPageController extends GetxController {
  late PersistentTabController persistentTabController;
  PageController pageController = PageController();
  List<Widget> pages = [
    const HomePage(),
    const CarsPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];
  List<IconData> pagesIcons = [
    Icons.home,
    Icons.car_crash,
    Icons.favorite,
    Icons.settings
  ];
  List<CategoryModel> categories = [
    CategoryModel(image: "assets/images/sport.webp", title: "رياضيّة"),
    CategoryModel(image: "assets/images/4x.webp", title: "دفع رباعي"),
    CategoryModel(image: "assets/images/cross.webp", title: "عبور"),
    CategoryModel(image: "assets/images/parity.webp", title: "زوج"),
    CategoryModel(image: "assets/images/changable.webp", title: "قابل للتحويل"),
    CategoryModel(image: "assets/images/sedan.webp", title: "سيدان"),
    CategoryModel(image: "assets/images/smallTruck.webp", title: "شاحنة صغيرة"),
    CategoryModel(image: "assets/images/hatchback.webp", title: "هاتشباك")
  ];
  List<TopCarsModel> topCars = [
    TopCarsModel(
        image: "assets/images/car2.webp",
        price: "234,500 AED",
        type: "بينتلي 2020",
        name: "Bentley",
        user: "admin"),
    TopCarsModel(
        image: "assets/images/car1.webp",
        price: "5,844,480 AED",
        type: "بينتلي 2020",
        name: "Bentley Bentayga Speed",
        user: "admin"),
  ];
  List<String> brandsImages = [
    "assets/images/bmw.webp",
    "assets/images/nissan.webp",
    "assets/images/toyota.webp",
    "assets/images/audi.webp",
    "assets/images/range-rover.webp",
    "assets/images/rolls-royce.webp",
    "assets/images/hyundai.webp"
  ];
  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 6));
      if (persistentTabController.index == 0) {
        if (pageController.page! < 2) {
          pageController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        } else {
          pageController.animateToPage(0,
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        }
      }
    }
  }

  handleFav(int index) {
    topCars[index].isFav = !topCars[index].isFav;
    update();
  }

  @override
  void onInit() {
    persistentTabController = PersistentTabController();
    swipeImages();
    super.onInit();
  }
}
