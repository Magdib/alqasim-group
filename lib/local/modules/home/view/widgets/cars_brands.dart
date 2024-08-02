import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class CarsBrands extends GetView<MainPageController> {
  const CarsBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: AppSize.screenWidth(context),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.brandsImages.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 30,
        ),
        itemBuilder: (context, index) => Container(
          width: AppSize.screenWidth(context) / 5,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  controller.brandsImages[index],
                ),
                fit: BoxFit.fitWidth,
              )),
        ),
      ),
    );
  }
}
