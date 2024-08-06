import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';

class ServicesDrawerRow extends StatelessWidget {
  const ServicesDrawerRow({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => Column(
        children: [
          InkWell(
            onTap: () => controller.drawerSelectService(index),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 52.5,
                  onPressed: () => controller.drawerSelectService(index),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  color: controller.drawerSelectedServices == index
                      ? AppColors.primaryColor
                      : AppColors.lGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.appCustomRadius)),
                  child: Icon(
                    AppStatics.homeServicesList[index].icon,
                    color: controller.drawerSelectedServices == index
                        ? AppColors.white
                        : AppColors.primaryColor,
                  ),
                ),
                Text(
                  AppStatics.homeServicesList[index].title,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          if (index != 4)
            const SizedBox(
              height: 10,
            ),
        ],
      ),
    );
  }
}
