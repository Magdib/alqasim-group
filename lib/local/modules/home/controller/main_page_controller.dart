import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/modules/carspage/view/pages/cars_page.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/modules/favoritepage/view/pages/favorite_page.dart';
import 'package:proj/local/modules/home/model/drawer_model.dart';
import 'package:proj/local/modules/home/view/pages/home_page.dart';
import 'package:proj/local/modules/account/view/pages/account_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});
}

class CarModel {
  final String image;
  final String price;
  final String type;
  final String name;
  final String user;
  final String? category;
  final bool removeCarWord;
  final String? date;
  final String? meters;
  final int? speed;
  bool isFav;
  CarModel({
    required this.image,
    required this.price,
    required this.type,
    required this.name,
    required this.user,
    this.category,
    this.removeCarWord = false,
    this.isFav = false,
    this.date,
    this.meters,
    this.speed,
  });
}

class MainPageController extends GetxController {
  int index = 2;
  int? selectedServices;
  int? drawerSelectedServices;
  double carPadding = Get.size.width;
  PageController sliderController = PageController();
  PageController pageController = PageController(initialPage: 2);
  late ScrollController scrollController;
  late Box authBox;
  List<Widget> pages = [
    const SizedBox(),
    const FavoritePage(),
    const HomePage(),
    const CarsPage(),
    const SettingsPage(),
  ];
  List<DrawerModel> drawerItems = [
    DrawerModel(title: "الرئيسية", route: AppRoutes.mainRoute, index: 2),
    DrawerModel(title: "السيارات", route: AppRoutes.mainRoute, index: 3),
    DrawerModel(title: "معلومات عنا", route: AppRoutes.mainRoute),
    DrawerModel(title: "خدماتنا", isDropDown: true, route: AppRoutes.mainRoute),
    DrawerModel(title: "مدوّنة", route: AppRoutes.mainRoute),
    DrawerModel(title: "اتّصال", route: AppRoutes.mainRoute)
  ];

  List<IconData> pagesIcons = [Icons.home, Icons.favorite, Icons.person];
  List<CategoryModel> categories = [
    CategoryModel(image: "assets/images/sport.webp", title: "رياضيّة"),
    CategoryModel(image: "assets/images/4x.webp", title: "دفع رباعي"),
    CategoryModel(image: "assets/images/cross.webp", title: "عبور"),
    CategoryModel(image: "assets/images/parity.webp", title: "زوج"),
    CategoryModel(
        image: "assets/images/changable.webp", title: "قابلة للتحويل"),
    CategoryModel(image: "assets/images/sedan.webp", title: "سيدان"),
    CategoryModel(image: "assets/images/smallTruck.webp", title: "شاحنة صغيرة"),
    CategoryModel(image: "assets/images/hatchback.webp", title: "هاتشباك")
  ];
  List<CarModel> topCars = [
    CarModel(
        image: "assets/images/car2.webp",
        price: "234,500 AED",
        type: "بينتلي 2020",
        name: "Bentley",
        user: "admin"),
    CarModel(
        image: "assets/images/car1.webp",
        price: "5,844,480 AED",
        type: "بينتلي 2020",
        name: "Bentley Bentayga Speed",
        user: "admin"),
  ];
  onPageChanged(value) async {
    if ((value == (index + 1) || value == (index - 1)) &&
        Get.currentRoute == AppRoutes.homePageRoute) {
      pageController.animateToPage(value,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
    } else {
      pageController.jumpToPage(
        value,
      );
    }
    index = value;
    if (value == 3 && !CarsPageController().initialized) {
      Get.put(CarsPageController());
    }
    if (value == 1 && !FavoritePageController().initialized) {
      Get.put(FavoritePageController());
    }
    if (value == 4 && !AccountController().initialized) {
      Get.put(AccountController());
    }
    update();
    Get.until(
      (route) => route.isFirst,
    );
  }

  bool handleMainOpenWhatsApp(int index) {
    if (index != 0) {
      return true;
    } else {
      openWhatsApp();
      return false;
    }
  }

  openWhatsApp() async {
    if (!await launchUrl(
      Uri.parse("https://wa.me/+963937386785"),
      mode: LaunchMode.externalApplication,
    )) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
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
      if (index == 2 && Get.currentRoute == AppRoutes.homePageRoute) {
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

  selectService(int index) {
    if (selectedServices == index) {
      selectedServices = null;
    } else {
      selectedServices = index;
    }
    update();
  }

  drawerSelectService(int index) {
    if (drawerSelectedServices == index) {
      drawerSelectedServices = null;
    } else {
      drawerSelectedServices = index;
    }
    update();
  }

  openSocial(int index) async {
    if (!await launchUrl(Uri.parse(AppStatics.alQassimSocials[index].link))) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
  }

  @override
  void onInit() {
    swipeImages();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset > 350) {
          carPadding = 0;
          update();
        }
      });
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
