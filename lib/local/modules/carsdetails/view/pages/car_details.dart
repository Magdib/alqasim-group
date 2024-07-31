import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/core/constant/app_size.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_description.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_forms.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_sub_details.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/details_images_slider.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/details_selectable_slider.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/cat_details_linked_cars.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<CarDetailsController>(
          builder: (controller) => FloatingActionButton(
                onPressed: () => controller.addToFav(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                backgroundColor: AppColors.white,
                child: Icon(
                  controller.isFav ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.red,
                  size: 28,
                ),
              )),
      body: GetBuilder<CarDetailsController>(
        builder: (controller) => CustomScrollView(slivers: <Widget>[
          const CarSliverAppBar(title: "تفاصيل السيارة"),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            const DetailsImagesSlider(),
            const SizedBox(
              height: 20,
            ),
            const DetailsSelectableSlider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CarSubDetails(),
                  const CarDescription(),
                  Text(
                    "الموقع:",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 350,
                    width: AppSize.screenWidth,
                    child: const GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(25.347681, 55.455117), zoom: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "السيارات ذات الصلة:",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CatDetailsLinkedCars(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "اتصل بالبائع:",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      ButtonWithIcon(
                        title: "اتصل الآن",
                        icon: Icons.call,
                        onPressed: () => controller.openCallApp(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ButtonWithIcon(
                        title: "عبر واتساب",
                        icon: FontAwesome.whatsapp_brand,
                        color: AppColors.deepGreen,
                        onPressed: () => controller.openWhatsApp(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CarForms(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ]))
        ]),
      ),
    );
  }
}
