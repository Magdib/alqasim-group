import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class DetailsImagesSlider extends StatelessWidget {
  const DetailsImagesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarDetailsController>(
      builder: (controller) => SizedBox(
        height: 200,
        width: AppSize.screenWidth / 1.5,
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: controller.images.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(controller.images[index]),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
