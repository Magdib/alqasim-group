import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/custom_icons.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/constant/colors.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/functions/wishlist/add_to_wishlist.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/carsdetails/data/car_details_data.dart';
import 'package:proj/local/modules/carsdetails/data/enums/save_images_state.dart';
import 'package:proj/local/modules/carsdetails/data/static/get_static_car_data.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/carsdetails/model/car_images_model.dart';
import 'package:proj/local/modules/carsdetails/model/details_titles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailsController extends GetxController {
  late Box<CarImagesModel> savedCarsBox;
  late PageController pageController;
  late ScrollController scrollController;
  late GoogleMapController googleMapsControl;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumController;
  late TextEditingController messageController;
  showImage(int index) {
    Get.dialog(
        Stack(
          children: [
            PhotoView(
              imageProvider:
                  CachedNetworkImageProvider(car.images[index].image),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              heroAttributes: PhotoViewHeroAttributes(
                tag: "showImage${index}",
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

  CarModel car = getStaticCarData();
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest emailStatusRequest = StatusRequest.none;
  String selectedLocal = Get.arguments[ArgumentsNames.selectedLocal];
  SaveImagesState saveImagesState = SaveImagesState.notSaved;
  int carId = Get.arguments[ArgumentsNames.carId];
  List<DetailsTitlesModel> carDetailsTitle = [
    DetailsTitlesModel(title: "سنة الصنع".tr, icon: Icons.date_range_outlined),
    DetailsTitlesModel(
        title: "الأميال المقطوعة".tr, icon: Icons.add_road_outlined),
    DetailsTitlesModel(
        title: "السرعة القصوى".tr,
        icon: CustomIcons.meter,
        addPadding: false,
        size: 35.r),
    DetailsTitlesModel(title: "ماركة".tr, icon: MingCute.car_line),
    DetailsTitlesModel(title: "نموذج".tr, icon: Icons.car_repair_outlined),
    DetailsTitlesModel(
        title: "نوع الوقود".tr, icon: Icons.local_gas_station_outlined),
    DetailsTitlesModel(
        title: "نوع التحويل".tr,
        icon: CustomIcons.gear,
        addPadding: false,
        size: 40.r),
    DetailsTitlesModel(title: "مدينة".tr, icon: Icons.location_city_outlined),
    DetailsTitlesModel(
        title: "المواصفات الإقليمية".tr, icon: Icons.list_alt_outlined),
    DetailsTitlesModel(
        title: "مجربة".tr, icon: Icons.accessibility_new_outlined),
    DetailsTitlesModel(
        title: "عدد الأبواب".tr, icon: Icons.door_sliding_outlined),
    DetailsTitlesModel(
        title: "عدد المقاعد".tr,
        icon: CustomIcons.seat,
        addPadding: false,
        size: 40.r),
    DetailsTitlesModel(
        title: "الرقم التسلسلي".tr,
        icon: Icons.onetwothree_sharp,
        addPadding: false,
        size: 40.r),
    DetailsTitlesModel(
        title: "اللون الداخلي".tr, icon: Icons.color_lens_outlined),
    DetailsTitlesModel(
        title: "اللون الخارجي".tr, icon: Icons.format_color_fill_outlined),
    DetailsTitlesModel(title: "التأمين".tr, icon: Icons.construction_outlined)
  ];
  List<String> carDetails = [];
  List<RelatedCars> linkedCars = [];
  bool isFav = false;
  addToFav() async {
    // await removeFromWishList(topCars[index].id.toString());
    await addToWishList(car.id.toString());
  }

  changeImage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(seconds: 1), curve: Curves.easeIn);
  }

  swipeImages() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      if (Get.currentRoute == AppRoutes.carDetailsPageRoute) {
        if (scrollController.offset < 300) {
          if (pageController.page! < car.images.length - 1) {
            pageController.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
          } else {
            pageController.animateToPage(0,
                duration: const Duration(seconds: 1), curve: Curves.easeIn);
          }
        }
      }
    }
  }

  openWhatsApp() async {
    String carText =
        "${'اسم السيارة:'.tr} ${car.productTitle}\n${'تصنيف السيارة:'.tr} ${car.categoryForDetails}\n${'نوع السيارة:'.tr} ${car.brand}\n${'وصف السيارة:'.tr} ${car.description}\n${'السعر:'.tr} ${car.symbolPrice}";
    if (!await launchUrl(
        Uri.parse("https://wa.me/+${car.vendor.phone}?text=$carText"),
        mode: LaunchMode.externalApplication)) {
      AppToasts.errorToast("حدث خطأ ما...".tr);
    }
  }

  openCallApp() async {
    if (!await launchUrl(Uri.parse("tel:+${car.vendor.phone}"))) {
      AppToasts.errorToast("حدث خطأ ما...".tr);
    }
  }

  saveImages() async {
    if (saveImagesState == SaveImagesState.notSaved) {
      saveImagesState = SaveImagesState.saving;
      update();
      List<String> saveImages = [];
      for (int i = 0; i < car.images.length; i++) {
        saveImages.add(car.images[i].image);
      }
      await savedCarsBox.add(CarImagesModel(
          id: car.id, carName: car.productTitle, images: saveImages));
      update();
      AppToasts.successToast("تم حفظ الصور بنجاح".tr);
      saveImagesState = SaveImagesState.saved;
      update();
    } else {
      AppToasts.errorToast("حدث خطأ ما...".tr);
    }
  }

  changeToLinkedCar(int index) async {
    carId = linkedCars[index].id;
    getCarData(true);
  }

  sendEmail() async {
    if (userNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumController.text.isNotEmpty &&
        messageController.text.isNotEmpty) {
      emailStatusRequest = StatusRequest.loading;
      update();
      CarDetailsData carDetailsData = CarDetailsData(Get.find());
      var response = await carDetailsData.sendEmailToVendorData(
          userNameController.text,
          emailController.text,
          phoneNumController.text,
          messageController.text,
          car.vendor.email);
      response.fold((l) {
        AppToasts.errorToast(l.message);
      }, (r) {
        String state = r['message'];
        if (state == "Email sent successfully") {
          emailStatusRequest = StatusRequest.none;
          AppToasts.successToast("تم إرسال الرسالة بنجاح".tr);
          messageController.clear();
        } else {
          AppToasts.errorToast("حدث خطأ ما...".tr);
        }
      });

      emailStatusRequest = StatusRequest.none;
      update();
    } else {
      AppToasts.errorToast("الرجاء ملئ الحقول المطلوبة".tr);
    }
  }

  getCarData([bool isRefresh = false]) async {
    if (isRefresh) {
      statusRequest = StatusRequest.loading;

      pageController.dispose();
      scrollController.dispose();
      pageController = PageController();
      scrollController = ScrollController();
      update();
    }
    CarDetailsData carDetailsData = CarDetailsData(Get.find());
    var response = await carDetailsData.getCarData(selectedLocal, "$carId");
    response.fold((l) {
      if (l.runtimeType == NetworkError) {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      log("$statusRequest");
      update();
      AppToasts.errorToast(l.message);
    }, (r) {
      Map<String, dynamic> data = r['data'];
      car = CarModel.fromJson(data);
      log("${r['data']}");
      linkedCars = car.relatedCars;
      saveImagesState = savedCarsBox.values.toList().any(
                (element) => element.carName == car.productTitle,
              )
          ? SaveImagesState.saved
          : SaveImagesState.notSaved;
      statusRequest = StatusRequest.none;
      carDetails = [
        car.year,
        car.mileage,
        car.speed,
        car.brand,
        car.model,
        car.fuelType,
        car.transmissionType,
        car.city,
        car.regionalSpecifications,
        car.isTested ? "نعم".tr : "لا".tr,
        car.doorNum,
        car.seatNum,
        car.cylinderNum,
        car.insideColor,
        car.outsideColor,
        car.isWarranty == "1"
            ? "موجود".tr
            : car.isWarranty == "-1"
                ? "غير قابل للتنفيذ".tr
                : "لا يوجد".tr
      ];
      swipeImages();
      update();
    });
  }

  @override
  void onInit() {
    pageController = PageController();
    scrollController = ScrollController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumController = TextEditingController();
    messageController = TextEditingController();
    getCarData();
    super.onInit();
  }

  @override
  void onReady() async {
    savedCarsBox = await Hive.openBox<CarImagesModel>(HiveBoxes.savedCarsBox);
    super.onReady();
  }

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    googleMapsControl.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumController.dispose();
    messageController.dispose();
    if (savedCarsBox.isOpen) {
      savedCarsBox.close();
    }
    super.dispose();
  }
}
