import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

import 'custom_button.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    this.icon,
    required this.title,
    this.image,
    this.color,
    this.minWidth,
    required this.onPressed,
  });
  final IconData? icon;
  final String? image;
  final String title;
  final Color? color;
  final double? minWidth;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonBody: "",
        buttonColor: color,
        buttonWidth: minWidth ?? AppSize.screenWidth / 2.2,
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            icon != null
                ? Icon(
                    icon,
                    color: AppColors.white,
                  )
                : Image.asset(
                    image!,
                    height: 40,
                    width: 40,
                  )
          ],
        ));
  }
}
