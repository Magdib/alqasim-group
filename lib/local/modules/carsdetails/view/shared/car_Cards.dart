import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_statics.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

import '../widgets/icon_title_row.dart';

class CarCards extends StatelessWidget {
  const CarCards({
    super.key,
    required this.cars,
  });
  final List<CarModel> cars;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305,
      child: PageView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => Container(
          width: AppSize.screenWidth(context),
          margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(color: AppColors.lBlack, blurRadius: 4)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: AppSize.screenWidth(context),
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          cars[index].image,
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
                      cars[index].type,
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
                        cars[index].name,
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
                          "بواسطة ${cars[index].user}",
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
                    Row(
                      children: [
                        IconTitleRow(
                          icon: AppStatics.carCardIcons[0],
                          text: cars[index].date!,
                          index: 0,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        IconTitleRow(
                          icon: AppStatics.carCardIcons[1],
                          text: cars[index].meters!,
                          index: 1,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconTitleRow(
                          icon: AppStatics.carCardIcons[2],
                          text: "${cars[index].speed!}",
                          index: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cars[index].price,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.bold,
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
