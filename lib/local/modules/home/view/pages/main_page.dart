import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/view/widgets/home_drawer.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCarPadding(context);
    return SafeArea(
      child: GetBuilder<MainPageController>(
        builder: (controller) => Scaffold(
            key: controller.scaffoldKey,
            appBar: AppBar(
              surfaceTintColor: AppColors.white,
              elevation: 10,
              shadowColor: AppColors.black,
              leadingWidth: 44.w,
              leading: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  onPressed: () =>
                      controller.scaffoldKey.currentState!.openDrawer(),
                  icon: Icon(Icons.menu_rounded)),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Image.asset(
                    "assets/images/logo2.webp",
                    width: AppSize.screenWidth(context) / 2,
                    fit: BoxFit.fitWidth,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
              toolbarHeight: 60.h,
              backgroundColor: AppColors.white,
            ),
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
