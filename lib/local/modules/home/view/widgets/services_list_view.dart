import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) => SizedBox(
        height: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
            ? 110.h
            : 95,
        width: AppSize.screenWidth(context),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          itemCount: controller.homeServicesList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 15.w,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              MaterialButton(
                minWidth: 52.5.w,
                onPressed: () => controller.selectService(index),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
                color: controller.selectedServices == index
                    ? AppColors.primaryColor
                    : AppColors.lGrey,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppSize.appCustomRadius)),
                child: Icon(
                  controller.homeServicesList[index].icon,
                  color: controller.selectedServices == index
                      ? AppColors.white
                      : AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                controller.homeServicesList[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
