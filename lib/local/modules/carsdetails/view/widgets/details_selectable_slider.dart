import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class DetailsSelectableSlider extends GetView<CarDetailsController> {
  const DetailsSelectableSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: AppSize.screenWidth,
      child: ListView.builder(
        itemCount: controller.images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => controller.changeImage(index),
          child: Container(
            height: 60,
            width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
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
