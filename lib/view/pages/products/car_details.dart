import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/controllers/car_details_controller.dart';
import 'package:proj/core/constant/app_size.dart';
import 'package:proj/core/constant/colors.dart';
import 'package:proj/view/widgets/buttons/custom_button.dart';
import 'package:proj/view/widgets/cars/cat_details_linked_cars.dart';
import 'package:proj/view/widgets/fields/custom_text_form_field.dart';

import '../../widgets/cars/car_forms.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CarDetailsController());
    return Scaffold(
      body: GetBuilder<CarDetailsController>(
        builder: (controller) => CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text(
                  "تفاصيل السيارة",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Schyler"),
                ),
                background: Image.asset(
                  "assets/images/sliver.webp",
                  fit: BoxFit.cover,
                )),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                )),
            expandedHeight: 150,
            collapsedHeight: 60,
            backgroundColor: AppColors.primaryColor,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              width: AppSize.screenWidth,
              child: ListView.builder(
                itemCount: controller.images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 60,
                  width: 120,
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "قابل للتحويل",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "bently",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const Text(
                    "234,500 AED",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo.webp",
                        width: 50,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "بواسطة admin",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Schyler"),
                          ),
                          Text(
                            "مجموع السيارات : 2",
                            style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12,
                                fontFamily: "Schyler"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "الوصف:",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Current Price : 234500.00 - Previous Price : - Top Speed (KMH) : 306 - Year : 2020 - Mileage : 5456898 - Is Featured : Yes - Latitude : Sharjah - Longitude : - Longitude : - Latitude : Sharjah - Longitude : - Latitude : çΩΩΩ - Latitude : sharjah - Longitude : sharjah - Exterior 3D View Video Link : - Interior 3D View Video Link : - Vendor : admin - Title : bently - Category : Convertible - Condition : Used - Brand : Bentley - Fuel Type : Diesel - Transmission Type : Automatic - Address : sharjah - City : Sharjah - Regional Specifications : GCC Spaces - Door Numbers : 4 - Seat Numbers : 6 - Cylinder Numbers : 6 - Horse Power : 700-799 - Is Warranty : True",
                    style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "مواصفات:",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 420,
                    child: GridView.builder(
                      itemCount: controller.carDetailsTitle.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, mainAxisExtent: 80),
                      itemBuilder: (context, index) => Column(
                        children: [
                          Text(
                            controller.carDetailsTitle[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                height: 1.3,
                                fontFamily: "Schyler"),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            controller.carDetails[index],
                            style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 13,
                                fontFamily: "Schyler"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "موقع",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset("assets/images/googleMap.PNG"),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "السيارات ذات الصلة",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CatDetailsLinkedCars(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "اتصل بالبائع",
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Schyler"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CarForms(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomButton(
                          buttonBody: "ssss",
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "اتصل الآن",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Schyler"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.call,
                                color: AppColors.white,
                              )
                            ],
                          ),
                          buttonWidth: AppSize.screenWidth / 2.2,
                          onTap: () {}),
                      const SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                          buttonBody: "ssss",
                          buttonColor: const Color(0xff008000),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "عبر واتساب",
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Schyler"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                FontAwesome.whatsapp_brand,
                                color: AppColors.white,
                              )
                            ],
                          ),
                          buttonWidth: AppSize.screenWidth / 2.2,
                          onTap: () {}),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ]))
        ]),
      ),
    );
  }
}
