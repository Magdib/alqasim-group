import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(color: AppColors.primaryColor, fontSize: 17.sp));
  }
}
