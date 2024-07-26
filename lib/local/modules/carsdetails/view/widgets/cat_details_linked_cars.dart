import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/controllers/car_details_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

class CatDetailsLinkedCars extends StatelessWidget {
  const CatDetailsLinkedCars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: const [BoxShadow(color: AppColors.lBlack, blurRadius: 5)]),
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
                const Text(
                  "بينتلي 2020",
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Schyler"),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                const FittedBox(
                  child: Text(
                    "Bentley Bentayga Speed",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Schyler"),
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
                    const Text(
                      "بواسطة admin",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Schyler"),
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
                      itemCount: controller.linkedCarsicotex.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 30,
                      ),
                      itemBuilder: (context, index) => Row(
                        children: [
                          Icon(
                            controller.linkedCarsicotex[index]["icon"],
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(controller.linkedCarsicotex[index]["text"],
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Schyler"))
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  "5844480AED",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Schyler"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
