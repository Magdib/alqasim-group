import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proj/local/core/constant/colors.dart';

class IconTitleRow extends StatelessWidget {
  const IconTitleRow({
    super.key,
    required this.text,
    required this.icon,
    this.index,
  });

  final String text;
  final IconData icon;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: index == 2 ? 30.r : null,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.grey,
                  fontSize: 12.sp,
                ))
      ],
    );
  }
}
