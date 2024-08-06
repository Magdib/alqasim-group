import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/core/functions/language/left_right_lang_pad.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

import 'cat_container.dart';

class HomeCategoriesView extends GetView<MainPageController> {
  const HomeCategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context),
      height: 170,
      margin: const EdgeInsets.all(10),
      child: PageView.builder(
        itemCount: controller.getCategoriesCount(),
        itemBuilder: (context, index) => controller.handleCategories(index)
            ? Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CatContainer(
                    image: index == 0
                        ? controller.categories[index].image
                        : controller.categories[index * 2 + 1].image,
                    title: index == 0
                        ? controller.categories[index].title
                        : controller.categories[index * 2 + 1].title,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CatContainer(
                    image: index == 0
                        ? controller.categories[index + 1].image
                        : controller.categories[index * 2].image,
                    title: index == 0
                        ? controller.categories[index + 1].title
                        : controller.categories[index * 2].title,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            //handle when translate
            : Padding(
                padding: leftRightLangPad(context),
                child: CatContainer(
                  image: index == 0
                      ? controller.categories[index + 1].image
                      : controller.categories[index * 2].image,
                  title: index == 0
                      ? controller.categories[index + 1].title
                      : controller.categories[index * 2].title,
                ),
              ),
      ),
    );
  }
}
