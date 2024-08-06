import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carspage/controller/seller_page_controller.dart';
import 'package:proj/local/modules/carspage/view/widgets/custom_fix_tab_bar_item.dart';
import 'package:proj/local/modules/carspage/view/widgets/seller_data_view.dart';
import 'package:proj/local/modules/home/view/widgets/grid_car_card.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';

class SellerCarsPage extends StatelessWidget {
  const SellerCarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          const CarSliverAppBar(title: "تفاصيل البائع"),
          SliverList(
              delegate: SliverChildListDelegate([
            const SellerDataView(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: AppSize.screenWidth(context),
              child: GetBuilder<SellerPageController>(
                builder: (controller) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: controller.fixedTabBarItems.length,
                  itemBuilder: (context, index) => CustomFixTabBarItem(
                    index: index,
                  ),
                ),
              ),
            ),
            GetBuilder<SellerPageController>(
              builder: (controller) => SizedBox(
                height: controller.sellerCars.length * 140,
                child: PageView.builder(
                  itemCount: controller.fixedTabBarItems.length,
                  controller: controller.pageController,
                  onPageChanged: (value) =>
                      controller.changeTabView(value, false),
                  itemBuilder: (context, index) => Container(
                    height: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: AppSize.screenWidth(context) / 2,
                    child: DynamicHeightGridView(
                        itemCount: controller.sellerCars.length,
                        crossAxisCount: 2,
                        builder: (context, index) => GridCarCard(
                            car: controller.sellerCars[index],
                            index: index,
                            addToFav: () {})),
                  ),
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
