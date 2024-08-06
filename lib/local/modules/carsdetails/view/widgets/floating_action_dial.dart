import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class FloatingActionDial extends GetView<CarDetailsController> {
  const FloatingActionDial({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
        spaceBetweenChildren: 10,
        childPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        childrenButtonSize: const Size(50, 50),
        buttonSize: const Size(50, 50),
        overlayOpacity: 0.4,
        backgroundColor: AppColors.primaryColor,
        overlayColor: AppColors.black,
        animatedIconTheme: const IconThemeData(
          color: AppColors.white,
        ),
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: AppColors.deepGreen,
            onTap: () => controller.openWhatsApp(),
            child: const Icon(
              FontAwesome.whatsapp_brand,
              color: AppColors.white,
            ),
          ),
          SpeedDialChild(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: AppColors.primaryColor,
            onTap: () => controller.openCallApp(),
            child: const Icon(
              Icons.call,
              color: AppColors.white,
            ),
          ),
          SpeedDialChild(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            backgroundColor: AppColors.red,
            onTap: () => controller.addToFav(),
            child: GetBuilder<CarDetailsController>(
              builder: (controller) => Icon(
                controller.isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.white,
              ),
            ),
          ),
        ]);
  }
}
