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
    this.reverse,
    required this.onPressed,
    this.iconTextDist,
  });
  final IconData? icon;
  final String? image;
  final String title;
  final Color? color;
  final double? minWidth;
  final VoidCallback? onPressed;
  final bool? reverse;
  final double? iconTextDist;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonBody: "",
        buttonColor: color,
        buttonWidth: minWidth ?? AppSize.screenWidth(context) / 2.2,
        onTap: onPressed,
        child: reverse == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          color: AppColors.white,
                        )
                      : Image.asset(
                          image!,
                          height: 40,
                          width: 40,
                        ),
                  SizedBox(
                    width: iconTextDist ?? 5,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: iconTextDist ?? 5,
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
