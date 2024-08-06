import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.title,
    required this.trailing,
  });
  final String title;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          trailing,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
