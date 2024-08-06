import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/constant/images.dart';

class AlQassemLogoCard extends StatelessWidget {
  const AlQassemLogoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: AppColors.lGreyD),
      child: Image.asset(
        AppImages.logo,
        height: 40,
        fit: BoxFit.fitHeight,
        color: AppColors.primaryColor,
      ),
    );
  }
}
