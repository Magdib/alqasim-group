import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/Local/Core/Constant/Colors.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';

class CustomFixTabBarItem extends StatelessWidget {
  const CustomFixTabBarItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerPageController>(
      builder: (controller) => Column(
        children: [
          MaterialButton(
            disabledColor: AppColors.lGreyL,
            minWidth: 125.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            onPressed: controller.selectedIndex == index
                ? null
                : () => controller.changeTabView(index),
            child: Text(
              controller.catCars[index].categoryName,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ),
          ),
          AnimatedContainer(
            height: 1.5.h,
            // margin: fixedTabPad(),
            alignment: Alignment.topRight,
            width: 125.w,
            duration: const Duration(milliseconds: 200),
            color: controller.selectedIndex == index
                ? AppColors.primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
          ),
        ],
      ),
    );
  }
}
