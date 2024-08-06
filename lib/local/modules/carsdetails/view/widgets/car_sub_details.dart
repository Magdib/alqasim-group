import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/routes/routes.dart';

class CarSubDetails extends StatelessWidget {
  const CarSubDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "قابلة للتحويل",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text("bently",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 16)),
        const SizedBox(
          height: 5,
        ),
        Text("234,500 AED",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
        const SizedBox(
          height: 5,
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
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.sellerCarsPageRoute),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "بواسطة admin",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "مجموع السيارات: 2",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 12,
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
