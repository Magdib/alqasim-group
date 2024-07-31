import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/colors.dart';

class CarSliverAppBar extends StatelessWidget {
  const CarSliverAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: false,
      pinned: true,
      floating: false,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 20,
                  )),
          background: Image.asset(
            "assets/images/sliver.webp",
            fit: BoxFit.cover,
          )),
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          )),
      expandedHeight: 150,
      collapsedHeight: 60,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
