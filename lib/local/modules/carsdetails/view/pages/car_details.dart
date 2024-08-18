import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/modules/carsdetails/controller/car_details_controller.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_description.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_forms.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/car_sub_details.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/contact_vendor_row.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/details_images_slider.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/details_selectable_slider.dart';
import 'package:proj/local/modules/carsdetails/view/widgets/floating_action_dial.dart';
import 'package:proj/local/view/shared/app_bottom_nav_bar.dart';
import 'package:proj/local/view/shared/car_sliver_app_bar.dart';
import 'package:proj/local/view/shared/handiling_data_widget.dart';
import 'package:proj/local/modules/carsdetails/view/shared/car_Cards.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<CarDetailsController>(
          builder: (controller) =>
              controller.statusRequest != StatusRequest.none
                  ? const SizedBox()
                  : const FloatingActionDial()),
      bottomNavigationBar: const AppBottomNavBar(),
      body: GetBuilder<CarDetailsController>(
        builder: (controller) => CustomScrollView(
            controller: controller.scrollController,
            slivers: <Widget>[
              CarSliverAppBar(title: "تفاصيل السيارة".tr),
              SliverList(
                  delegate: SliverChildListDelegate([
                HandlingScrollDataRequest(
                  statusRequest: controller.statusRequest,
                  onTap: () => controller.getCarData(true),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      const DetailsImagesSlider(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const DetailsSelectableSlider(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CarSubDetails(),
                            ContactVendorRow(),
                            SizedBox(
                              height: 15.h,
                            ),
                            const CarDescription(),
                            Text("الموقع:".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 16.sp)),
                            SizedBox(
                              height: 15.h,
                            ),
                            // SizedBox(
                            //   height: 350.h,
                            //   width: AppSize.screenWidth(context),
                            //   child: GoogleMap(
                            //     onMapCreated: (googleMapsController) =>
                            //         controller.googleMapsControl =
                            //             googleMapsController,
                            //     initialCameraPosition: CameraPosition(
                            //         target: LatLng(
                            //             double.parse(controller.car.latitude),
                            //             double.parse(controller.car.longitude)
                            //             ),
                            //         zoom: 12),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text("السيارات ذات الصلة:".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 16.sp)),
                            SizedBox(
                              height: 7.5.h,
                            ),
                            CarCards(
                              cars: controller.linkedCars,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text("اتصل بالبائع:".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 16.sp)),
                            SizedBox(
                              height: 15.h,
                            ),
                            ContactVendorRow(),
                            SizedBox(
                              height: 20.h,
                            ),
                            const CarForms(),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]))
            ]),
      ),
    );
  }
}
