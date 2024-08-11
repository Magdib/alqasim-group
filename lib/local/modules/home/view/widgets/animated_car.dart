import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/core/functions/language/left_right_lang_align.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class AnimatedCar extends StatelessWidget {
  const AnimatedCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => Directionality(
        textDirection: controller.selectedLocal == "ar"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Transform.flip(
          flipX: controller.selectedLocal == "en" ? true : false,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            padding: EdgeInsets.only(left: controller.carPadding),
            //Handle on Translate
            alignment: leftRightLangAlign("ar"),
            child: Image.asset(
              "${AppImages.imageRoute}/sideCar.png",
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
