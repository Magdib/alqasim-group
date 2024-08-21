import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/favoritepage/data/wishlist_data.dart';

Future<bool> addToWishList(String carId) async {
  Box authBox = Hive.box(HiveBoxes.authBox);
  String? token = authBox.get(HiveKeys.token);
  bool dataToReturn = false;
  if (token == null) {
    Get.toNamed(AppRoutes.signInPageRoute);
    AppToasts.errorToast("قم بتسجيل الدخول للمتابعة".tr);
  } else {
    WishlistData wishlistData = WishlistData(Get.find());
    var response = await wishlistData.addToWishList(carId, token);
    response.fold((tl) {
      if (tl.runtimeType == NetworkError) {
        AppToasts.errorToast("...لا يوجد اتصال بالإنترنت".tr);
      } else {
        AppToasts.errorToast("حدث خطأ ما...");
      }
    }, (tr) async {
      AppToasts.successToast("تمت الإضافة إلى قائمة الرغبات".tr);
      dataToReturn = true;
    });
  }
  return dataToReturn;
}
