import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/functions/check_internet_connection.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/carsdetails/model/car_images_model.dart';
import 'package:proj/local/view/widgets/buttons/custom_button.dart';

class SavedImagesController extends GetxController {
  late Box<CarImagesModel> savedCarImagesBox;
  List<CarImagesModel> cars = [];
  StatusRequest statusRequest = StatusRequest.loading;
  deleteCarImages(int index) {
    savedCarImagesBox.deleteAt(index);
    cars.removeAt(index);
    update();
  }

  handleDeleteCar(BuildContext context, int index) async {
    if (await checkInternet()) {
      if (Get.isDialogOpen == false) {
        Get.defaultDialog(
          title: "حدث خطأ ما...".tr,
          backgroundColor: AppColors.white,
          titleStyle: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.primaryColor),
          content: Column(
            children: [
              Text(
                "تم حذف بيانات السيارة ولم تعد متوفّرة هل تريد حذفها لديك أيضاً"
                    .tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            height: 40.h,
                            buttonBody: "تأكيد".tr,
                            buttonColor: AppColors.red,
                            onTap: () {
                              savedCarImagesBox.deleteAt(index);
                              cars.removeAt(index);
                              Get.back();
                              update();
                            })),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: CustomButton(
                            height: 40.h,
                            buttonBody: "إلغاء".tr,
                            buttonColor: AppColors.primaryColor,
                            onTap: () => Get.back())),
                  ],
                ),
              )
            ],
          ),
        );
      }
    }
  }

  showImage(int index, int subIndex) {
    Get.dialog(
        Stack(
          children: [
            PhotoView(
              imageProvider:
                  CachedNetworkImageProvider(cars[index].images[subIndex]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(
                tag: "showImage${index}${subIndex}",
              ),
            ),
            Positioned(
                top: 30.h,
                right: getLanguage().languageCode == "ar" ? 10.w : null,
                left: getLanguage().languageCode == "en" ? 10.w : null,
                child: Hero(
                  tag: "arrowBack",
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
                ))
          ],
        ),
        useSafeArea: false);
  }

  @override
  void onReady() async {
    savedCarImagesBox = await Hive.openBox(HiveBoxes.savedCarsBox);
    cars = savedCarImagesBox.values.toList();
    statusRequest = StatusRequest.none;
    update();
    super.onReady();
  }

  @override
  void dispose() {
    savedCarImagesBox.close();
    super.dispose();
  }
}
