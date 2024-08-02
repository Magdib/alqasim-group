import 'package:flutter/material.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/constant/colors.dart';

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
      width: AppSize.screenWidth(context) / 2 - 30,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          border: Border.all(color: AppColors.primaryColor, width: 2)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            width: AppSize.screenWidth(context) / 2 - 40,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: AppSize.screenWidth(context) / 2 - 40,
            height: 50,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColors.lGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Text(title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    )),
          )
        ],
      ),
    );
  }
}
