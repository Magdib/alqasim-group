import 'package:flutter/material.dart';
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
            minWidth: 125,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onPressed: controller.selectedIndex == index
                ? null
                : () => controller.changeTabView(index, true),
            child: Text(
              controller.fixedTabBarItems[index],
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedContainer(
            height: 1.5,
            // margin: fixedTabPad(),
            alignment: Alignment.topRight,
            width: 125,
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
