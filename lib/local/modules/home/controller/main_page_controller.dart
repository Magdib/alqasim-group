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
import 'package:proj/local/modules/home/model/api/top_car_model.dart';
import 'package:proj/local/modules/home/model/drawer_model.dart';
import 'package:proj/local/modules/home/model/home_services_model.dart';
import 'package:proj/local/modules/home/view/pages/home_page.dart';
import 'package:proj/local/modules/account/view/pages/account_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/api/categories_model.dart';
import '../model/api/home_slider_model.dart';

class MainPageController extends GetxController {
  late int pageIndex;
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
  List<CategoriesModel> categoriesData = [];
  String? catNextPageUrl;
  List<TopCarModel> topCars = [];
  defineLists() {
    homeServicesList = [
      HomeServicesModel(
          title: "التمويل والتأمين".tr,
          icon: Icons.monetization_on_outlined,
          text: "نوع الخدمة: خيارات التمويل والتأمين المرنة.\n".tr),
      HomeServicesModel(
          title: "المبيعات والدعم".tr,
          icon: Icons.sell_outlined,
          text: "نوع الخدمة: مبيعات الخبراء ودعم ما بعد البيع.\n".tr),
      HomeServicesModel(
          title: "مساعدة في \nتسجيل السيارة".tr,
          icon: Icons.contact_page_outlined,
          text:
              "نوع الخدمة: المساعدة في تسجيل السيارة. (تأمين - امتحان - تسجيل).\n"
                  .tr),
      HomeServicesModel(
          title: "صفقات التصدير".tr,
          icon: Icons.shopping_cart_checkout,
          text: "نوع الخدمة: صفقات التصدير والخدمات المتاحة.\n".tr),
      HomeServicesModel(
          title: "تسليم سيارة".tr,
          icon: Icons.car_rental_outlined,
          text:
              "نوع الخدمة: تسليم السيارة إلى أي مكان في الإمارات العربية المتحدة\n"
                  .tr),
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
    log("$pageIndex");
    if ((value == (pageIndex + 1) || value == (pageIndex - 1)) &&
        Get.currentRoute == AppRoutes.homePageRoute) {
      pageController.animateToPage(value,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 500));
    } else {
      pageController.jumpToPage(
        value,
      );
    }
    pageIndex = value;
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
    try {
      if (!await launchUrl(
        Uri.parse("https://wa.me/+971542222307?text=$text"),
        mode: LaunchMode.externalApplication,
      )) {
        AppToasts.errorToast("...حدث خطأ ما".tr);
      }
    } catch (e) {
      AppToasts.errorToast("...حدث خطأ ما".tr);
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
      if (pageIndex == 2 &&
          Get.currentRoute == AppRoutes.homePageRoute &&
          scrollController.offset < 100) {
        if (sliderController.page! < sliderData.length - 1) {
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
    // topCars[index].isFav = !topCars[index].isFav;
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
      AppToasts.errorToast("...حدث خطأ ما".tr);
    }
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
    getData(true);
    switch (pageIndex) {
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
      categoriesData.clear();
      statusRequest = StatusRequest.loading;
      update();
    }
    onPageChanged(2);
    HomeData homeData = HomeData(Get.find());
    var response = await homeData.getSliderData(selectedLocal);
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
      var topCarsResponse = await homeData.getTopCarsData(selectedLocal);
      topCarsResponse.fold((tl) {
        if (tl.runtimeType == NetworkError) {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
        AppToasts.errorToast(tl.message);
      }, (tr) async {
        List jsonData = tr['data'];
        topCars = jsonData.map((e) => TopCarModel.fromJson(e)).toList();
        log("data $tr");

        var categoriesResponse =
            await homeData.getCategoriesData(selectedLocal);
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
          categoriesData.addAll(
              cJsonData.map((e) => CategoriesModel.fromJson(e)).toList());
          log("data $cr");
          scrollController
            ..addListener(() {
              if (scrollController.offset > 600 && carPadding != 0) {
                carPadding = 0;
                update();
              }
            });
          statusRequest = StatusRequest.none;

          swipeImages();
          categoriesScrollController = ScrollController()
            ..addListener(() => categoriesPagination());

          update();
        });
      });
    });
  }

  getCatData(bool keepGettingData) async {
    if (catNextPageUrl != null) {
      HomeData homeData = HomeData(Get.find());
      var categoriesResponse = await homeData.getCategoriesData(selectedLocal,
          nextPageUrl: catNextPageUrl!);
      categoriesResponse.fold((l) async {
        update();
        AppToasts.errorToast(l.message);
        categoriesScrollController.animateTo(
            categoriesScrollController.position.maxScrollExtent - 100,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn);
        if (keepGettingData) {
          await Future.delayed(Duration(seconds: 10));
          getCatData(keepGettingData);
        }
      }, (r) {
        List cJsonData = r['data'];
        catNextPageUrl = r['meta']['nextPageUrl'];
        if (catNextPageUrl == null) {
          categoriesStatusRequest = StatusRequest.none;
        }
        categoriesData
            .addAll(cJsonData.map((e) => CategoriesModel.fromJson(e)).toList());
        update();
      });
    }
  }

  categoriesPagination() async {
    if (categoriesScrollController.offset ==
        categoriesScrollController.position.maxScrollExtent) {
      getCatData(false);
    }
  }

  goToDetailsPage(int carId) {
    Get.toNamed(AppRoutes.carDetailsPageRoute, arguments: {
      ArgumentsNames.selectedLocal: selectedLocal,
      ArgumentsNames.carId: carId
    });
  }

  @override
  void onInit() {
    pageIndex = 2;
    scrollController = ScrollController();
    defineLists();
    super.onInit();
  }

  @override
  void onReady() async {
    if (!Hive.isBoxOpen(HiveBoxes.authBox)) {
      authBox = await Hive.openBox(HiveBoxes.authBox);
    } else {
      authBox = Hive.box(HiveBoxes.authBox);
    }
    String? local = authBox.get(HiveKeys.language);
    selectedLocal = local == null ? Get.deviceLocale!.languageCode : local;
    await getData(false);
    super.onReady();
  }
}
