import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/view/shared/custom_cached_net_image.dart';

class CatContainer extends StatelessWidget {
  const CatContainer({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context) - 40,
      height: 170.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.lGrey,
          boxShadow: [
            BoxShadow(color: AppColors.grey.withOpacity(0.8), blurRadius: 4.r)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: CustomCachedNetImage(
              canReDownload: false,
              width: AppSize.screenWidth(context) - 50,
              height: 100.h,
              fit: BoxFit.fitHeight,
              borderRadius: 6.r,
              imageUrl: image,
            ),
          ),
          Container(
            width: AppSize.screenWidth(context) - 50,
            height: 45.h,
            margin: EdgeInsets.only(bottom: 5.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23.r),
                  bottomRight: Radius.circular(23.r),
                )),
            child: Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
          ),
        ],
      ),
    );
  }
}
