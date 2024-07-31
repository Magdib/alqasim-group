import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

class CatDetailsLinkedCars extends StatelessWidget {
  const CatDetailsLinkedCars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: AppSize.screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.lBlack, blurRadius: 5)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: AppSize.screenWidth,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/car1.webp",
                        ),
                        fit: BoxFit.fitWidth,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "بينتلي 2020",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: Text(
                        "Bentley Bentayga Speed",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.webp",
                          width: 30,
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "بواسطة admin",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: AppColors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    SizedBox(
                      height: 40,
                      width: AppSize.screenWidth,
                      child: GetBuilder<CarDetailsController>(
                        builder: (controller) => ListView.separated(
                          itemCount: controller.linkedCarsIconText.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => SizedBox(
                            width: index == 1 ? 20 : 30,
                          ),
                          itemBuilder: (context, index) => Row(
                            children: [
                              Icon(
                                controller.linkedCarsIconText[index].icon,
                                size: controller.linkedCarsIconText[index].size,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(controller.linkedCarsIconText[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: AppColors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      "5844480AED",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
