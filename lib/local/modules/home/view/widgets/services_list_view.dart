import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/app_statics.dart';
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
        height: 80,
        width: AppSize.screenWidth(context),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          itemCount: AppStatics.homeServicesList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          itemBuilder: (context, index) => Column(
            children: [
              MaterialButton(
                minWidth: 52.5,
                onPressed: () => controller.selectService(index),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                color: controller.selectedServices == index
                    ? AppColors.primaryColor
                    : AppColors.lGrey,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppSize.appCustomRadius)),
                child: Icon(
                  AppStatics.homeServicesList[index].icon,
                  color: controller.selectedServices == index
                      ? AppColors.white
                      : AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                AppStatics.homeServicesList[index].title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
