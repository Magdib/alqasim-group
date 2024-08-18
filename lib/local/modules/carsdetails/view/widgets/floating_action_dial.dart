import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class FloatingActionDial extends GetView<CarDetailsController> {
  const FloatingActionDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        spaceBetweenChildren: 10.h,
        childPadding: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
            ? EdgeInsets.only(left: 15.w)
            : EdgeInsets.zero,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.r)),
        childrenButtonSize: Size(50.w, 50.h),
        buttonSize: Size(50.w, 50.h),
        overlayOpacity: 0.4,
        backgroundColor: AppColors.primaryColor,
        overlayColor: AppColors.black,
        animatedIconTheme: IconThemeData(
          color: AppColors.white,
        ),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r)),
            backgroundColor: AppColors.deepGreen,
            onTap: () => controller.openWhatsApp(),
            child: Icon(
              FontAwesome.whatsapp_brand,
              color: AppColors.white,
              size: 24.r,
            ),
          ),
          SpeedDialChild(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r)),
            backgroundColor: AppColors.primaryColor,
            onTap: () => controller.openCallApp(),
            child: Icon(
              Icons.call,
              color: AppColors.white,
              size: 24.r,
            ),
          ),
          SpeedDialChild(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r)),
            backgroundColor: AppColors.red,
            onTap: () => controller.addToFav(),
            child: GetBuilder<CarDetailsController>(
              builder: (controller) => Icon(
                controller.isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.white,
                size: 24.r,
              ),
            ),
          ),
        ]);
  }
}
