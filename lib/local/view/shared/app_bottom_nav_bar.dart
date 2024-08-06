import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => Hero(
        tag: "BottomBar",
        child: SizedBox(
          width: AppSize.screenWidth(context),
          child: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 400),
            backgroundColor: Colors.transparent,
            height: 65,
            index: controller.index,
            color: AppColors.primaryColor,
            maxWidth: AppSize.screenWidth(context),
            letIndexChange: (value) => controller.handleMainOpenWhatsApp(value),
            items: <Widget>[
              Icon(
                AppStatics.navBarData[0].icon,
                color: AppColors.white,
              ),
              Icon(
                AppStatics.navBarData[1].icon,
                color: AppColors.white,
              ),
              Icon(
                AppStatics.navBarData[2].icon,
                color: AppColors.white,
              ),
              Icon(
                AppStatics.navBarData[3].icon,
                color: AppColors.white,
              ),
              Icon(
                AppStatics.navBarData[4].icon,
                color: AppColors.white,
              ),
            ],
            onTap: (index) => controller.onPageChanged(index),
          ),
        ),
      ),
    );
  }
}
