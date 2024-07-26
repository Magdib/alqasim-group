import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class CarDetailsController extends GetxController {
  late PageController pageController;
  List<String> images = [
    "assets/images/car11.webp",
    "assets/images/car13.webp",
    "assets/images/car14.webp",
    "assets/images/car15.webp",
    "assets/images/car12.webp",
  ];
  List<String> carDetailsTitle = [
    "سنة الصنع",
    "الأميال المقطوعة",
    "السرعة القصوى",
    "ماركة",
    "نوع التحويل",
    "مدينة",
    "المواصفات الإقليمية",
    "مجربة",
    "عدد الأبواب",
    "عدد المقاعد",
    "رقم السيريال",
    "اللون الداخلي",
    "اللون الخارجي",
    "الورينتي"
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
    "غير قابل للتطبيق"
  ];
  List<Map<String, dynamic>> linkedCarsicotex = [
    {"icon": Icons.date_range_outlined, "text": "2020"},
    {"icon": Icons.add_road, "text": "51,402"},
    {"icon": Icons.speed_rounded, "text": "306"},
  ];
  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 6));
      if (pageController.page! < images.length - 1) {
        pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      } else {
        pageController.animateToPage(0,
            duration: const Duration(seconds: 1), curve: Curves.easeIn);
      }
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
