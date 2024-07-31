import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/view/widgets/filters_view.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/view/widgets/fields/custom_text_form_field.dart';

import '../widgets/filter_dialog.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: "أدخل اسم السيارة هنا...",
            icon: const Icon(
              Icons.search,
            ),
            textInputAction: TextInputAction.search,
            suffixIcon: IconButton(
                onPressed: () => filterDialog(context),
                icon: const Icon(CustomIcons.filter)),
          ),
          const FiltersView(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GetBuilder<MainPageController>(
              builder: (controller) => GridView.builder(
                itemCount: controller.topCars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Column(
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
                              controller.topCars[index].image,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.topCars[index].price,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              InkWell(
                                  onTap: () => controller.handleFav(index),
                                  child: Icon(
                                    controller.topCars[index].isFav
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColors.primaryColor,
                                  ))
                            ],
                          ),
                          FittedBox(
                            child: Text(
                              controller.topCars[index].name,
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
            ),
          )
        ],
      ),
    );
  }
}
