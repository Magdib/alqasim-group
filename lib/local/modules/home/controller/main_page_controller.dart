import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/modules/carspage/view/pages/cars_page.dart';
import 'package:proj/local/modules/favoritepage/favorite_page.dart';
import 'package:proj/local/modules/home/model/bottom_nav_bar_model.dart';
import 'package:proj/local/modules/home/model/drawer_model.dart';
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
  int index = 0;
  PageController sliderController = PageController();
  PageController pageController = PageController();
  late Box authBox;
  List<Widget> pages = [
    const HomePage(),
    const CarsPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];
  List<DrawerModel> drawerItems = [
    DrawerModel(title: "الرئيسية", route: AppRoutes.mainRoute, index: 0),
    DrawerModel(title: "السيارات", route: AppRoutes.mainRoute, index: 1),
    DrawerModel(title: "معلومات عنا", route: AppRoutes.mainRoute),
    DrawerModel(title: "مدوّنة", route: AppRoutes.mainRoute),
    DrawerModel(title: "اتّصال", route: AppRoutes.mainRoute)
  ];
  List<BottomNavBarModel> navBarData = [
    BottomNavBarModel(
      title: "الرئيسية",
      icon: Icons.home,
    ),
    BottomNavBarModel(
      title: "السيارات",
      icon: CustomIcons.filter,
    ),
    BottomNavBarModel(
      title: "الرغبات",
      icon: Icons.favorite,
    ),
    BottomNavBarModel(
      title: "واتساب",
      icon: FontAwesome.whatsapp_brand,
    ),
    BottomNavBarModel(
      title: "المستخدم",
      icon: Icons.person,
    ),
  ];
  List<IconData> pagesIcons = [Icons.home, Icons.favorite, Icons.person];
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
  onPageChanged(value) async {
    index = value;
    pageController.animateToPage(value,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
    if (value == 1 && !CarsPageController().initialized) {
      Get.put(CarsPageController());
    }
    update();
  }

  handleDrawerNavigation(int value) {
    if (drawerItems[value].index == null) {
      Get.toNamed(drawerItems[value].route!);
    } else {
      onPageChanged(drawerItems[value].index);
    }
    update();
  }

  int getCategoriesCount() {
    if (categories.length % 2 == 0) {
      return categories.length ~/ 2;
    } else {
      return categories.length ~/ 2 + 1;
    }
  }

  bool handleCategories(int index) {
    if (categories.length % 2 == 0 || index * 2 != categories.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 6));
      if (index == 0 && Get.currentRoute == AppRoutes.homePageRoute) {
        if (sliderController.page! < 2) {
          sliderController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        } else {
          sliderController.animateToPage(0,
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
    swipeImages();
    super.onInit();
  }

  @override
  void onReady() async {
    if (!Hive.isBoxOpen(HiveBoxes.authBox)) {
      authBox = await Hive.openBox(HiveBoxes.authBox);
    }
    super.onReady();
  }
}
