import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';

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
                  minWidth: 52.5.w,
                  onPressed: () => controller.drawerSelectService(index),
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
                  color: controller.drawerSelectedServices == index
                      ? AppColors.primaryColor
                      : AppColors.lGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.appCustomRadius.r)),
                  child: Icon(
                    controller.homeServicesList[index].icon,
                    color: controller.drawerSelectedServices == index
                        ? AppColors.white
                        : AppColors.primaryColor,
                    size: 24.r,
                  ),
                ),
                Text(
                  controller.homeServicesList[index].title
                      .replaceAll("\n", " "),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          if (index != 4)
            SizedBox(
              height: 10.h,
            ),
        ],
      ),
    );
  }
}
