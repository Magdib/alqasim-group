import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carspage/controller/cars_page_controller.dart';

class FilterGridView extends StatelessWidget {
  const FilterGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarsPageController>(
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20, childAspectRatio: 1.3),
        itemCount: controller.filters.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.filters[index].filterName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 14,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonHideUnderline(
              child: Container(
                width: AppSize.screenWidth(context) / 2.2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButton(
                  isExpanded: false,
                  dropdownColor: AppColors.white,
                  menuMaxHeight: 160,
                  value: controller.filters[index].selectedValue,
                  borderRadius: BorderRadius.circular(6),
                  hint: Text(
                    "الجميع",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.grey),
                  ),
                  items: controller.filters[index].filterValues
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: AppColors.grey),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) =>
                      controller.changeFilterValue(index, value!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
