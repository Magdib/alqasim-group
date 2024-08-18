import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            childAspectRatio:
                AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
                    ? 1.3.h
                    : 1.5.h),
        itemCount: controller.filters.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.filters[index].filterName,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DropdownButtonHideUnderline(
              child: Container(
                width: AppSize.screenWidth(context) / 2.2,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6)),
                child: DropdownButton(
                  itemHeight: 48.h,
                  isExpanded: false,
                  dropdownColor: AppColors.white,
                  menuMaxHeight: 160.h,
                  value: controller.filters[index].selectedValue,
                  borderRadius: BorderRadius.circular(6),
                  hint: Text(
                    "الجميع".tr,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.grey, fontSize: 12.sp),
                  ),
                  items: controller.filters[index].filterValues
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    color: AppColors.grey,
                                    fontSize: e.length > 18 ? 8.sp : 12.sp),
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
