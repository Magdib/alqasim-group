import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        builder: (controller) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: controller.index == index
                  ? const EdgeInsets.symmetric(vertical: 5, horizontal: 20)
                  : const EdgeInsets.symmetric(horizontal: 1),
              decoration: controller.index == index
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    )
                  : null,
              child: controller.index == index
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          controller.navBarData[index].icon,
                          color: AppColors.primaryColor,
                          size: 26,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          controller.navBarData[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: AppColors.primaryColor),
                        )
                      ],
                    )
                  : IconButton(
                      onPressed: () => controller.onPageChanged(index),
                      icon: Icon(
                        controller.navBarData[index].icon,
                        color: AppColors.white,
                        size: 26,
                      )),
            ));
  }
}
