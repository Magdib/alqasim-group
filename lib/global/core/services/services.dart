import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/firebase_options.dart';
import 'package:proj/local/core/notifications/notififctions_service_impl.dart';
import 'package:proj/local/modules/auth/login/model/login_model.dart';
import 'package:proj/local/modules/carsdetails/model/car_images_model.dart';
import '../../../local/core/class/hive_box.dart';

class AppServices extends GetxService {
  //i use it for initialize all data i need instead of initialize it in the main function
  // static LoginRes? loginUserResponseModel;
  // static LocalizationController? localizationController;
  // static String fcmToken='';
  // GetStorageClass getStorageClass = GetStorageClass();
  late Box authBox;
  Future<AppServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();

    authBox = await Hive.openBox(HiveBoxes.authBox);
    await NotificationsServiceImpl().init();
    Hive.registerAdapter<CarImagesModel>(CarImagesModelAdapter());
    Hive.registerAdapter<LoginModel>(LoginModelAdapter());
    // if (box.get(HiveKeys.userId) != null) {
    //   userId = box.get(HiveKeys.userId);
    //   debugPrint("user id  $userId");
    // }
    // box.put(HiveKeys.showAd, false);
    // log("user id  $userId");
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
