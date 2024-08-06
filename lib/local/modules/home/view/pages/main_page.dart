import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/view/widgets/home_app_bar.dart';
import 'package:proj/local/modules/home/view/widgets/home_drawer.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainPageController>(
        builder: (controller) => Scaffold(
            appBar: homeAppBar(context),
            drawer: const HomeDrawer(),
            bottomNavigationBar: const AppBottomNavBar(),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: controller.pages,
            )),
      ),
    );
  }
}
