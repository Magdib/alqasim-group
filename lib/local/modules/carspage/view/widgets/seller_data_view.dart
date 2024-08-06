import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';
import 'package:proj/local/view/widgets/dividers/custom_horizontal_divider.dart';

import 'custom_text_row.dart';

class SellerDataView extends StatelessWidget {
  const SellerDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: const [BoxShadow(color: AppColors.lBlack, blurRadius: 4)]),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.appCustomRadius),
                image: const DecorationImage(
                    image: AssetImage(AppImages.adminImage),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text("Admin", style: Theme.of(context).textTheme.displayLarge!),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Amjad",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomHorizontalDivider(),
          const SizedBox(
            height: 5,
          ),
          const CustomTextRow(
            title: "مجموع السيارات:",
            trailing: "2",
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomTextRow(
            title: "عنوان:",
            trailing: "Sharjah - UAE",
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomHorizontalDivider(),
        ],
      ),
    );
  }
}
