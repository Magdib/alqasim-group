import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/modules/home/model/al_qassem_socials_model.dart';
import 'package:proj/local/modules/home/model/bottom_nav_bar_model.dart';
import 'package:proj/local/modules/home/model/home_services_model.dart';

class AppStatics {
  static final List<Map<String, String>> slidablePages = [
    {
      "image": "assets/images/onboarding3.webp",
      "text": "انطلق في رحلة سيارتك مع قائمة السيارات"
    },
    {
      "image": "assets/images/onboarding1.webp",
      "text": "اكتشف سيارتك المثالية مع قائمة السيارات"
    },
    {
      "image": "assets/images/onboarding2.jpg",
      "text": "خدماتنا متميزة ومتنوعة"
    },
  ];
  static final List<IconData> carCardIcons = [
    Icons.date_range_outlined,
    Icons.add_road,
    CustomIcons.meter,
  ];
  static final List<BottomNavBarModel> navBarData = [
    BottomNavBarModel(
      title: "واتساب",
      icon: FontAwesome.whatsapp_brand,
    ),
    BottomNavBarModel(
      title: "الرغبات",
      icon: Icons.favorite,
    ),
    BottomNavBarModel(
      title: "الرئيسية",
      icon: Icons.home,
    ),
    BottomNavBarModel(
      title: "السيارات",
      icon: CustomIcons.filter,
    ),
    BottomNavBarModel(
      title: "المستخدم",
      icon: Icons.person,
    ),
  ];
  static final List<HomeServicesModel> homeServicesList = [
    HomeServicesModel(
        title: "شراء سيارة",
        icon: Icons.monetization_on_outlined,
        text: "أريد شراء سيارة من فضلك"),
    HomeServicesModel(
        title: "تصدير سيارة",
        icon: Icons.shopping_cart_checkout,
        text: "أريد شراء سيارة من فضلك"),
    HomeServicesModel(
        title: "بيع سيارة",
        icon: Icons.sell_outlined,
        text: "أريد شراء سيارة من فضلك"),
    HomeServicesModel(
        title: "بيع سيارة",
        icon: Icons.sell_outlined,
        text: "أريد شراء سيارة من فضلك"),
    HomeServicesModel(
        title: "بيع سيارة",
        icon: Icons.sell_outlined,
        text: "أريد شراء سيارة من فضلك"),
  ];
  static final List<AlQassemSocialsModel> alQassimSocials = [
    AlQassemSocialsModel(
        FontAwesome.tiktok_brand, "https://www.tiktok.com/@alqassemgroup"),
    AlQassemSocialsModel(FontAwesome.instagram_brand,
        "https://www.instagram.com/alqassem_group_luxury_cars/"),
    AlQassemSocialsModel(
        FontAwesome.facebook_brand, "https://www.facebook.com/alqaseem.group/")
  ];
}
