import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/modules/carsdetails/model/details_titles_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailsController extends GetxController {
  late PageController pageController;
  List<String> images = [
    "assets/images/car11.webp",
    "assets/images/car13.webp",
    "assets/images/car14.webp",
    "assets/images/car15.webp",
    "assets/images/car12.webp",
  ];
  List<DetailsTitlesModel> carDetailsTitle = [
    DetailsTitlesModel(title: "سنة الصنع", icon: Icons.date_range_outlined),
    DetailsTitlesModel(
        title: "الأميال المقطوعة", icon: Icons.add_road_outlined),
    DetailsTitlesModel(
        title: "السرعة القصوى",
        icon: CustomIcons.meter,
        addPadding: false,
        size: 35),
    DetailsTitlesModel(title: "ماركة", icon: MingCute.car_line),
    DetailsTitlesModel(title: "نموذج", icon: Icons.car_repair_outlined),
    DetailsTitlesModel(
        title: "نوع الوقود", icon: Icons.local_gas_station_outlined),
    DetailsTitlesModel(
        title: "نوع التحويل",
        icon: CustomIcons.gear,
        addPadding: false,
        size: 40),
    DetailsTitlesModel(title: "مدينة", icon: Icons.location_city_outlined),
    DetailsTitlesModel(
        title: "المواصفات الإقليمية", icon: Icons.list_alt_outlined),
    DetailsTitlesModel(title: "مجربة", icon: Icons.accessibility_new_outlined),
    DetailsTitlesModel(title: "عدد الأبواب", icon: Icons.door_sliding_outlined),
    DetailsTitlesModel(
        title: "عدد المقاعد",
        icon: CustomIcons.seat,
        addPadding: false,
        size: 40),
    DetailsTitlesModel(
        title: "الرقم التسلسلي",
        icon: Icons.onetwothree_sharp,
        addPadding: false,
        size: 40),
    DetailsTitlesModel(title: "اللون الداخلي", icon: Icons.color_lens_outlined),
    DetailsTitlesModel(
        title: "اللون الخارجي", icon: Icons.format_color_fill_outlined),
    DetailsTitlesModel(title: "التأمين", icon: Icons.construction_outlined)
  ];
  List<String> carDetails = [
    "2020",
    "5456",
    "306(KMH)",
    "بينتلي",
    "2020",
    "ديزل",
    "تلقائي",
    "الشارقة",
    "فارغ",
    "نعم",
    "4",
    "6",
    "6",
    "بني",
    "أسود",
    "لا يوجد"
  ];
  List<CarModel> linkedCars = [
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
        image: "assets/images/car1.webp",
        price: "5844480AED",
        type: "بينتلي 2020",
        name: "Bentley Bentayga Speed",
        user: "admin",
        date: "2020",
        meters: "51,402",
        speed: 306),
    CarModel(
        image: "assets/images/car1.webp",
        price: "5844480AED",
        type: "بينتلي 2020",
        name: "Bentley Bentayga Speed",
        user: "admin",
        date: "2020",
        meters: "51,402",
        speed: 306),
  ];
  bool isFav = false;
  addToFav() {
    isFav = !isFav;
    if (isFav) {
      AppToasts.successToast("تمت الإضافة إلى قائمة الرغبات");
    } else {
      AppToasts.successToast("تم الحذف من قائمة الرغبات");
    }
    update();
  }

  changeImage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      if (pageController.page! < images.length - 1) {
        pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      } else {
        pageController.animateToPage(0,
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      }
    }
  }

  openWhatsApp() async {
    String carText = "Hello";
    if (!await launchUrl(Uri.parse("https://wa.me/+963937386785?text=$carText"),
        mode: LaunchMode.externalApplication)) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
  }

  openCallApp() async {
    if (!await launchUrl(Uri.parse("tel:+963937386785"))) {
      AppToasts.errorToast("حدث خطأ ما!");
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    swipeImages();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
