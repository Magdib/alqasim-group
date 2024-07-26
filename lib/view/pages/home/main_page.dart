import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:proj/controllers/main_page_controller.dart';
import 'package:proj/core/constant/colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetBuilder<MainPageController>(
          builder: (controller) => PersistentTabView(
            context,
            controller: controller.persistentTabController,
            screens: controller.pages,
            items: [
              PersistentBottomNavBarItem(
                  icon: Icon(
                    controller.pagesIcons[0],
                  ),
                  title: ("الرئيسية"),
                  textStyle: const TextStyle(fontFamily: "Schyler"),
                  inactiveColorPrimary: AppColors.white,
                  activeColorPrimary: AppColors.white,
                  activeColorSecondary: AppColors.primaryColor),
              PersistentBottomNavBarItem(
                  icon: const Icon(MingCute.car_fill),
                  title: ("السيارات"),
                  textStyle: const TextStyle(fontFamily: "Schyler"),
                  inactiveColorPrimary: AppColors.white,
                  activeColorPrimary: AppColors.white,
                  activeColorSecondary: AppColors.primaryColor),
              PersistentBottomNavBarItem(
                  icon: Icon(controller.pagesIcons[2]),
                  title: ("المفضّلة"),
                  textStyle: const TextStyle(fontFamily: "Schyler"),
                  inactiveColorPrimary: AppColors.white,
                  activeColorPrimary: AppColors.white,
                  activeColorSecondary: AppColors.primaryColor),
              PersistentBottomNavBarItem(
                  icon: Icon(controller.pagesIcons[3]),
                  title: ("الإعدادات"),
                  textStyle: const TextStyle(fontFamily: "Schyler"),
                  inactiveColorPrimary: AppColors.white,
                  activeColorPrimary: AppColors.white,
                  activeColorSecondary: AppColors.primaryColor),
            ],
            resizeToAvoidBottomInset: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            backgroundColor: AppColors.primaryColor,
            animationSettings: const NavBarAnimationSettings(
              navBarItemAnimation: ItemAnimationSettings(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeIn,
              ),
              screenTransitionAnimation: ScreenTransitionAnimationSettings(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                duration: Duration(milliseconds: 200),
                screenTransitionAnimationType:
                    ScreenTransitionAnimationType.slide,
              ),
            ),
            confineToSafeArea: true,
            navBarHeight: 65,
            navBarStyle: NavBarStyle.style7,
          ),
        ),
        // body: ,
      ),
    );
  }
}
