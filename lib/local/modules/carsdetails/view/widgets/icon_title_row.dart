import 'package:flutter/material.dart';
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
          size: index == 2 ? 30 : null,
          color: AppColors.primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.grey,
                  fontSize: 12,
                ))
      ],
    );
  }
}
