import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        builder: (controller) => AnimatedContainer(
            height: controller.filterValues.isNotEmpty ? 45.h : 0,
            duration: const Duration(milliseconds: 200),
            child: controller.filterValues.isNotEmpty
                ? FittedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 35.h,
                          width: AppSize.screenWidth(context),
                          child: ListView.separated(
                            itemCount: controller.filterValues.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10.w,
                            ),
                            itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.lGreyD,
                                  borderRadius: BorderRadius.circular(6.r)),
                              child: Row(
                                children: [
                                  Text(
                                    controller.filterValues[index].value,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  controller.filterValues[index]
                                              .filterValueType ==
                                          FilterValueTypes.lowPrice
                                      ? Icon(
                                          Icons.arrow_circle_down_sharp,
                                          color: AppColors.green,
                                          size: 24.r,
                                        )
                                      : controller.filterValues[index]
                                                  .filterValueType ==
                                              FilterValueTypes.highPrice
                                          ? Icon(
                                              Icons.arrow_circle_up_sharp,
                                              color: AppColors.red,
                                              size: 24.r,
                                            )
                                          : const SizedBox(),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: AppColors.white,
                                      child: IconButton(
                                          padding: EdgeInsets.zero,
                                          iconSize: 15.r,
                                          onPressed: () =>
                                              controller.deleteFilter(index),
                                          icon: const Icon(Icons.close,
                                              color: AppColors.black)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox()));
  }
}
