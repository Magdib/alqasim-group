import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';
import 'package:proj/local/modules/carspage/data/enums/filter_value_types.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarsPageController>(
        builder: (controller) => SizedBox(
              height: 35,
              width: AppSize.screenWidth,
              child: ListView.separated(
                itemCount: controller.filterValues.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.lGreyD,
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      Text(
                        controller.filterValues[index].value,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      controller.filterValues[index].filterValueType ==
                              FilterValueTypes.lowPrice
                          ? const Icon(
                              Icons.arrow_circle_down_sharp,
                              color: AppColors.green,
                            )
                          : controller.filterValues[index].filterValueType ==
                                  FilterValueTypes.highPrice
                              ? const Icon(
                                  Icons.arrow_circle_up_sharp,
                                  color: AppColors.red,
                                )
                              : const SizedBox(),
                      const SizedBox(
                        width: 15,
                      ),
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.white,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 15,
                              onPressed: () => controller.deleteFilter(index),
                              icon: const Icon(Icons.close,
                                  color: AppColors.black)))
                    ],
                  ),
                ),
              ),
            ));
  }
}
