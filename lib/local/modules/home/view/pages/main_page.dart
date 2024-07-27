import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/view/widgets/bottom_nav_bar_item.dart';
import 'package:proj/local/modules/home/view/widgets/home_app_bar.dart';
import 'package:proj/local/modules/home/view/widgets/home_drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MainPageController>(
        builder: (controller) => Scaffold(
            appBar: homeAppBar(),
            drawer: const HomeDrawer(),
            bottomNavigationBar: Container(
              color: AppColors.primaryColor,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: AppSize.screenWidth,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomNavBarItem(
                      index: 0,
                    ),
                    BottomNavBarItem(
                      index: 1,
                    ),
                    BottomNavBarItem(
                      index: 2,
                    ),
                    BottomNavBarItem(
                      index: 3,
                    ),
                    BottomNavBarItem(
                      index: 4,
                    ),
                  ]),
            ),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: controller.pages,
            )),
      ),
    );
  }
}
