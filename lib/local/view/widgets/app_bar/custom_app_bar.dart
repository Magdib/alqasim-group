import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

AppBar customAppBar(
    {Color? color,
    required BuildContext context,
    required String title,
    bool isBack = false,
    List<Widget>? actions,
    Widget? leading}) {
  return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: color ?? AppColors.primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: AppColors.white,
            ),
      ),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: isBack,
      toolbarHeight:
          AppSize.screenWidth(context) >= AppSize.tabletBreakPoint ? 90 : null,
      iconTheme: IconThemeData(
          size: AppSize.screenWidth(context) >= AppSize.tabletBreakPoint
              ? 20
              : null,
          color: AppColors.white));
}
