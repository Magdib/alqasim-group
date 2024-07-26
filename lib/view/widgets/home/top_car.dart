import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/controllers/main_page_controller.dart';
import 'package:proj/core/constant/app_size.dart';
import 'package:proj/core/constant/colors.dart';
import 'package:proj/core/routes/routes.dart';

class TopCar extends StatelessWidget {
  const TopCar({
    super.key,
    required this.topCar,
    required this.index,
  });
  final TopCarsModel topCar;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.carDetailsPageRoute),
      child: Stack(
        children: [
          Container(
            width: AppSize.screenWidth / 2 - 30,
            padding: const EdgeInsets.symmetric(horizontal: 3),
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
                border: Border.all(color: AppColors.primaryColor, width: 2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: AppSize.screenWidth / 2 - 45,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(
                            topCar.image,
                          ),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: AppSize.screenWidth / 2 - 40,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: AppColors.lGrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          topCar.price,
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Schyler"),
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          topCar.type,
                          style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Schyler"),
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        FittedBox(
                          child: Text(
                            topCar.name,
                            style: const TextStyle(
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
                            Text(
                              "بواسطة ${topCar.user}",
                              style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Schyler"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          GetBuilder<MainPageController>(
            builder: (controller) => Positioned(
                top: 7,
                right: 7,
                child: InkWell(
                    onTap: () => controller.handleFav(index),
                    child: Icon(
                      controller.topCars[index].isFav
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: AppColors.primaryColor,
                    ))),
          ),
        ],
      ),
    );
  }
}
