import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/Local/Core/Constant/Colors.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/favoritepage/controller/favorite_Page_controller.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

class FavoritePage extends GetView<FavoritePageController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(10), children: [
      const SizedBox(
        height: 10,
      ),
      CustomTextFormField(
        hint: "أدخل اسم السيارة هنا...",
        icon: const Icon(
          Icons.search,
        ),
        textInputAction: TextInputAction.search,
        onChange: (value) => controller.filterCars(value),
      ),
      const SizedBox(
        height: 20,
      ),
      GetBuilder<FavoritePageController>(
          builder: (controller) => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: controller.viewCars.length,
              itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.viewCars[index].removeCarWord
                              ? "${controller.viewCars[index].filterTitle}:"
                              : "سيارات ${controller.viewCars[index].filterTitle}:",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView.separated(
                            separatorBuilder: (context, subIndex) =>
                                const SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.viewCars[index].cars.length,
                            itemBuilder: (context, subIndex) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: AppSize.screenWidth / 2 - 15,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          controller.viewCars[index]
                                              .cars[subIndex].image,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: AppSize.screenWidth / 2 - 15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller.viewCars[index]
                                                .cars[subIndex].price,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                  color: AppColors.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                // controller.handleFav(index)
                                              },
                                              child: Icon(
                                                controller.viewCars[index]
                                                        .cars[subIndex].isFav
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_outlined,
                                                color: AppColors.primaryColor,
                                              ))
                                        ],
                                      ),
                                      FittedBox(
                                        child: Text(
                                          controller.viewCars[index]
                                              .cars[subIndex].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall!
                                              .copyWith(
                                                fontSize: 11.5,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ])))
    ]);
  }
}
