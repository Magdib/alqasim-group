import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class HomeSlider extends GetView<MainPageController> {
  const HomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
          itemCount: AppStatics.slidablePages.length,
          controller: controller.sliderController,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image:
                          AssetImage(AppStatics.slidablePages[index]['image']!),
                      fit: BoxFit.cover,
                      opacity: 0.8)),
              child: Center(
                child: Text(AppStatics.slidablePages[index]['text']!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.bold)),
              ),
            );
          }),
    );
  }
}
