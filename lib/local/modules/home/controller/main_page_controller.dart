import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/account/controller/account_controller.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/modules/carspage/view/pages/cars_page.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/modules/favoritepage/view/pages/favorite_page.dart';
import 'package:proj/local/modules/home/data/home_data.dart';
import 'package:proj/local/modules/home/model/drawer_model.dart';
import 'package:proj/local/modules/home/model/home_services_model.dart';
import 'package:proj/local/modules/home/view/pages/home_page.dart';
import 'package:proj/local/modules/account/view/pages/account_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/api/categories_model.dart';
import '../model/api/home_slider_model.dart';

class CarModel {
  final String image;
  final String price;
  final String type;
  final String name;
  final String user;
  final String? category;
  final String? date;
  final String? meters;
  final int? speed;
  final List<String>? images;
  final String? carDesc;
  bool isFav;
  CarModel({
    required this.image,
    required this.price,
    required this.type,
    required this.name,
    required this.user,
    this.carDesc,
    this.images,
    this.category,
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
  late double carPadding;
  PageController sliderController = PageController();
  PageController pageController = PageController(initialPage: 2);
  late ScrollController scrollController;
  late ScrollController categoriesScrollController;
  late Box authBox;
  String selectedLocal = "";
  List<Widget> pages = [
    const SizedBox(),
    const FavoritePage(),
    const HomePage(),
    const CarsPage(),
    const SettingsPage(),
  ];
  late List<HomeServicesModel> homeServicesList;
  late List<DrawerModel> drawerItems;
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest categoriesStatusRequest = StatusRequest.loading;
  List<IconData> pagesIcons = [Icons.home, Icons.favorite, Icons.person];
  List<HomeSliderModel> sliderData = [];
  List<HomeSliderModel> sliderListView = [];
  List<CategoriesModel> categoriesData = [];
  List<CategoriesModel> categoriesListView = [];
  String? catNextPageUrl;
  List<CarModel> topCars = [
    CarModel(
        image: "assets/images/car2.webp",
        price: "234,500 AED",
        type: "بينتلي 2020",
        images: [
          "assets/images/car11.webp",
          "assets/images/car13.webp",
          "assets/images/car14.webp",
          "assets/images/car15.webp",
          "assets/images/car12.webp",
        ],
        carDesc:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        category: "قابلة للتحويل",
        name: "Bentley",
        user: "admin"),
    CarModel(
        image: "assets/images/car1.webp",
        price: "5,844,480 AED",
        type: "بينتلي 2020",
        images: [
          "assets/images/car21.webp",
          "assets/images/car22.webp",
          "assets/images/car23.webp",
          "assets/images/car24.webp",
          "assets/images/car25.webp",
          "assets/images/car26.webp",
          "assets/images/car27.webp",
        ],
        carDesc:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        category: "قابلة للتحويل",
        name: "Bentley Bentayga Speed",
        user: "admin"),
  ];
  defineLists() {
    homeServicesList = [
      HomeServicesModel(
          title: "شراء سيارة".tr,
          icon: Icons.monetization_on_outlined,
          text: "نوع الخدمة: شراء سيارة\n".tr),
      HomeServicesModel(
          title: "تصدير سيارة".tr,
          icon: Icons.shopping_cart_checkout,
          text: "نوع الخدمة: تصدير سيارة\n".tr),
      HomeServicesModel(
          title: "بيع سيارة".tr,
          icon: Icons.sell_outlined,
          text: "نوع الخدمة: بيع سيارة\n".tr),
      HomeServicesModel(
          title: "غير معرّفة",
          icon: Icons.question_mark_outlined,
          text: "نوع الخدمة: غير معرّفة\n"),
      HomeServicesModel(
          title: "غير معرّفة",
          icon: Icons.question_mark_outlined,
          text: "نوع الخدمة: غير معرّفة\n"),
    ];
    drawerItems = [
      DrawerModel(title: "الرئيسية".tr, route: AppRoutes.mainRoute, index: 2),
      DrawerModel(title: "السيارات".tr, route: AppRoutes.mainRoute, index: 3),
      DrawerModel(
          title: "معلومات عنا".tr, link: "https://alqassimgroup.net/about-us"),
      DrawerModel(
        title: "خدماتنا".tr,
        isDropDown: true,
      ),
      DrawerModel(
          title: "مدوّنة".tr,
          route: AppRoutes.mainRoute,
          link: "https://alqassimgroup.net/blog"),
      DrawerModel(
          title: "اتّصال".tr,
          route: AppRoutes.mainRoute,
          link: "https://alqassimgroup.net/contact")
    ];
  }

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
    if (value == 3) {
      CarsPageController carsPageController = Get.put(CarsPageController());
      carsPageController.initializeData();
    }
    if (value == 1 && !FavoritePageController().initialized) {
      Get.put(FavoritePageController());
    }
    if (value == 4 && !AccountController().initialized) {
      AccountController accountController = Get.put(AccountController());

      accountController.defineLists();
    }
    update();
    if (Get.currentRoute != AppRoutes.homePageRoute) {
      Get.until(
        (route) => route.isFirst,
      );
    }
  }

  bool handleMainOpenWhatsApp(int index) {
    if (index != 0) {
      return true;
    } else {
      openWhatsApp();
      return false;
    }
  }

  openWhatsApp([String text = ""]) async {
    if (!await launchUrl(
      Uri.parse("https://wa.me/+971542222307?text=$text"),
      mode: LaunchMode.externalApplication,
    )) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
  }

  handleDrawerNavigation(int value) {
    if (drawerItems[value].index == null) {
      Get.toNamed(AppRoutes.inAppWebViewPageRoute,
          arguments: {ArgumentsNames.webViewLink: drawerItems[value].link});
    } else {
      onPageChanged(drawerItems[value].index);
    }
    update();
  }

  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 6));
      if (index == 2 &&
          Get.currentRoute == AppRoutes.homePageRoute &&
          scrollController.offset < 100) {
        if (sliderController.page! < sliderListView.length - 1) {
          sliderController.animateToPage(sliderController.page!.round() + 1,
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
    if (!await launchUrl(Uri.parse(AppStatics.alQassimSocials[index].link),
        mode: LaunchMode.externalApplication)) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
  }

  goToCarDetailsPage(int index) {
    Get.toNamed(AppRoutes.carDetailsPageRoute,
        arguments: {ArgumentsNames.carData: topCars[index]});
  }

  askForService(int index) {
    openWhatsApp(homeServicesList[index].text);
  }

  getCarPadding(BuildContext context) {
    carPadding = MediaQuery.of(context).size.width;
  }

  changeLanguage(String value) async {
    Locale newLocale;
    if (value == "عربي") {
      selectedLocal = "ar";
      newLocale = const Locale('ar');
    } else {
      selectedLocal = "en";
      newLocale = const Locale('en');
    }
    update();
    authBox.put(HiveKeys.language, selectedLocal);
    await Get.updateLocale(newLocale);

    defineLists();
    filterSliderData();
    filterCategoriesData();
    getCatData();
    switch (index) {
      case 3:
        CarsPageController carsPageController = Get.find();
        carsPageController.initializeData();

      case 4:
        AccountController accountController = Get.find();
        accountController.defineLists();
    }
  }

  getData(bool isRefresh) async {
    if (isRefresh) {
      statusRequest = StatusRequest.loading;
      update();
    }
    scrollController = ScrollController();
    HomeData homeData = HomeData(Get.find());
    var response = await homeData.getSliderData();
    response.fold((l) {
      if (l.runtimeType == NetworkError) {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      log("$statusRequest");
      update();
      AppToasts.errorToast(l.message);
    }, (r) async {
      List jsonData = r['data'];
      sliderData = jsonData.map((e) => HomeSliderModel.fromJson(e)).toList();
      log("data $r");
      filterSliderData();
      swipeImages();
      var categoriesResponse = await homeData.getCategoriesData();
      categoriesResponse.fold((cl) {
        if (cl.runtimeType == NetworkError) {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
        AppToasts.errorToast(cl.message);
      }, (cr) {
        List cJsonData = cr['data'];
        catNextPageUrl = cr['meta']['nextPageUrl'];
        if (catNextPageUrl == null) {
          categoriesStatusRequest = StatusRequest.none;
        }
        categoriesData
            .addAll(cJsonData.map((e) => CategoriesModel.fromJson(e)).toList());
        log("data $cr");
        filterCategoriesData();
        scrollController
          ..addListener(() {
            if (scrollController.offset > 300 && carPadding != 0) {
              carPadding = 0;
              update();
            }
          });
        statusRequest = StatusRequest.none;
        categoriesScrollController = ScrollController()
          ..addListener(() => categoriesPagination());
        update();
      });
    });
  }

  getCatData() async {
    if (catNextPageUrl != null) {
      HomeData homeData = HomeData(Get.find());
      var categoriesResponse = await homeData.getCategoriesData(catNextPageUrl);
      categoriesResponse.fold((l) {
        update();
        AppToasts.errorToast(l.message);
        categoriesScrollController.animateTo(
            categoriesScrollController.position.maxScrollExtent - 100,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn);
      }, (r) {
        List cJsonData = r['data'];
        catNextPageUrl = r['meta']['nextPageUrl'];
        if (catNextPageUrl == null) {
          categoriesStatusRequest = StatusRequest.none;
        }
        categoriesData
            .addAll(cJsonData.map((e) => CategoriesModel.fromJson(e)).toList());
        filterCategoriesData();
      });
    }
  }

  categoriesPagination() async {
    if (categoriesScrollController.offset ==
        categoriesScrollController.position.maxScrollExtent) {
      getCatData();
    }
  }

  filterSliderData() {
    sliderListView = sliderData
        .where(
          (element) => element.language == selectedLocal,
        )
        .toList();
    update();
  }

  filterCategoriesData() {
    categoriesListView = categoriesData
        .where(
          (element) => element.language == selectedLocal,
        )
        .toList();
    if (categoriesListView.length <= 1) {
      getCatData();
    }
    update();
  }

  @override
  void onInit() {
    getData(false);
    defineLists();
    super.onInit();
  }

  @override
  void onReady() async {
    if (!Hive.isBoxOpen(HiveBoxes.authBox)) {
      authBox = await Hive.openBox(HiveBoxes.authBox);
    }
    String? local = authBox.get(HiveKeys.language);
    selectedLocal = local == null ? Get.deviceLocale!.languageCode : local;
    super.onReady();
  }
}
