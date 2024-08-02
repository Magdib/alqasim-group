import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:proj/local/modules/OnBoarding/controller/on_boarding_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: GetBuilder<OnBoardingController>(
            builder: (controller) => Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: AppStatics.slidablePages.length,
                    controller: controller.pageController,
                    onPageChanged: (value) => controller.onPageChanged(value),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          height: AppSize.screenHight(context) / 1.3,
                          color: AppColors.black,
                        ),
                        Image.asset(
                          AppStatics.slidablePages[index]['image']!,
                          height: AppSize.screenHight(context) / 1.3,
                          opacity: const AlwaysStoppedAnimation(0.9),
                          width: AppSize.screenWidth(context),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 80,
                          left: 40,
                          right: 40,
                          child: Text(
                            AppStatics.slidablePages[index]['text']!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SmoothPageIndicator(
                    controller: controller.pageController,
                    count: AppStatics.slidablePages.length,
                    effect: const WormEffect(
                        activeDotColor: AppColors.primaryColor,
                        radius: 16,
                        dotHeight: 6,
                        dotWidth: 6)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                      buttonBody: controller.index < 1 ? "التالي" : "ابدأ",
                      onTap: () => controller.moveToNextPage()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
