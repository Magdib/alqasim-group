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
          color: AppColors.lGrey,
          boxShadow: [
            BoxShadow(color: AppColors.grey.withOpacity(0.8), blurRadius: 4)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset(
              image,
              width: AppSize.screenWidth(context) / 2 - 40,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: AppSize.screenWidth(context) / 2 - 40,
            height: 50,
            margin: const EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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
