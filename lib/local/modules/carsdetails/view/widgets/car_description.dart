import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';

class CarDescription extends GetView<CarDetailsController> {
  const CarDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المواصفات:",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 625,
          child: GridView.builder(
            itemCount: controller.carDetailsTitle.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 80,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: controller.carDetailsTitle[index].addPadding
                      ? const EdgeInsets.all(7.5)
                      : null,
                  decoration: BoxDecoration(
                      color: AppColors.lGrey,
                      borderRadius: BorderRadius.circular(2)),
                  child: Icon(
                    controller.carDetailsTitle[index].icon,
                    size: controller.carDetailsTitle[index].size,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: controller.carDetailsTitle[index].title.length * 6,
                      child: FittedBox(
                        alignment: Alignment.centerRight,
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.carDetailsTitle[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 12,
                                height: 1.3,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      controller.carDetails[index],
                      textAlign: TextAlign.start,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.grey,
                                fontSize: 11,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text("الوصف:", style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Current Price : 234500.00 - Previous Price : - Top Speed (KMH) : 306 - Year : 2020 - Mileage : 5456898 - Is Featured : Yes - Latitude : Sharjah - Longitude : - Longitude : - Latitude : Sharjah - Longitude : - Latitude : çΩΩΩ - Latitude : sharjah - Longitude : sharjah - Exterior 3D View Video Link : - Interior 3D View Video Link : - Vendor : admin - Title : bently - Category : Convertible - Condition : Used - Brand : Bentley - Fuel Type : Diesel - Transmission Type : Automatic - Address : sharjah - City : Sharjah - Regional Specifications : GCC Spaces - Door Numbers : 4 - Seat Numbers : 6 - Cylinder Numbers : 6 - Horse Power : 700-799 - Is Warranty : True",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColors.grey, fontSize: 12),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
