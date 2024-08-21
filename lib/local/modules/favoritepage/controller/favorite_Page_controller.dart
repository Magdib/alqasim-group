import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/class/hive_box.dart';
import 'package:proj/local/core/class/hive_keys.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/functions/wishlist/remove_from_wishlist.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/favoritepage/data/wishlist_data.dart';
import 'package:proj/local/modules/favoritepage/model/api/favorite_model.dart';
import 'package:proj/local/modules/favoritepage/model/filtered_cars_model.dart';

class FavoritePageController extends GetxController {
  List<FilteredCarsModel> viewCars = [];
  List<FavoriteModel> cars = [];
  Box authBox = Hive.box(HiveBoxes.authBox);
  String? token;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest paginationStatusRequest = StatusRequest.loading;
  bool gettingData = false;
  late ScrollController scrollController;
  String? nextPageUrl;
  filterCars(String value) {
    if (value.isNotEmpty) {
      List<FavoriteModel> filterCars = cars
          .where((car) => car.productTitle.isCaseInsensitiveContains(value))
          .toList();
      initializeCars(filterCars);
    } else {
      initializeCars(cars);
    }
    update();
  }

  goToDetailsPage(int index, int subIndex) {
    Get.toNamed(AppRoutes.carDetailsPageRoute, arguments: {
      ArgumentsNames.selectedLocal: getLanguage().languageCode,
      ArgumentsNames.carId: viewCars[index].cars[subIndex].id
    });
  }

  removeCar(int index, int subIndex) async {
    update();
    viewCars[index].isLoadingList[subIndex] = true;
    if (await removeFromWishList(
            viewCars[index].cars[subIndex].id.toString()) ==
        true) {
      cars.removeWhere(
        (car) => car.id == viewCars[index].cars[subIndex].id,
      );
      viewCars[index].isLoadingList.removeAt(subIndex);
      viewCars[index].cars.removeAt(subIndex);
      if (viewCars[index].cars.isEmpty) {
        viewCars.removeAt(index);
      }
    }
    update();
  }

  initializeData([bool showLoading = true]) async {
    token = authBox.get(HiveKeys.token);
    if (token != null) {
      if (showLoading) {
        statusRequest = StatusRequest.loading;
        update();
      }
      WishlistData wishlistData = WishlistData(Get.find());
      var response = await wishlistData.getWishListData(token!);
      response.fold((tl) {
        if (tl.runtimeType == NetworkError) {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();

        AppToasts.errorToast(tl.message);
      }, (tr) async {
        List jsonData = tr['data'];
        nextPageUrl = tr['meta']['nextPageUrl'];
        List<FavoriteModel> tempCars;

        tempCars = jsonData.map((e) => FavoriteModel.fromJson(e)).toList();
        log("${cars.length}");
        if (cars.isEmpty) {
          cars = tempCars;
          initializeCars(cars);
        } else if (tempCars != cars) {
          cars = tempCars;
          initializeCars(cars);
          AppToasts.successToast("تم تحديث البيانات".tr);
        }
        statusRequest = StatusRequest.none;
        update();
        scrollController.addListener(
          () => handlePagination(),
        );
      });
    }
  }

  initializeCars(List<FavoriteModel> selectedCars) {
    viewCars.clear();
    for (int i = 0; i < selectedCars.length; i++) {
      int categoryIndex = viewCars.indexWhere(
        (viewCars) =>
            viewCars.filterTitle == selectedCars[i].categoryForDetails,
      );
      if (categoryIndex != -1) {
        viewCars[categoryIndex].cars.add(selectedCars[i]);
        viewCars[categoryIndex].isLoadingList.add(false);
      } else {
        viewCars.add(FilteredCarsModel(
            cars: [selectedCars[i]],
            filterTitle: selectedCars[i].categoryForDetails,
            isLoadingList: [false]));
      }
    }
  }

  handlePagination() async {
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      if (nextPageUrl != null && gettingData == false) {
        gettingData = true;
        update();
        WishlistData wishlistData = WishlistData(Get.find());
        var response = await wishlistData.getWishListData(token!, nextPageUrl);
        response.fold((tl) {
          AppToasts.errorToast(tl.message);
        }, (tr) async {
          List jsonData = tr['data'];
          nextPageUrl = tr['meta']['nextPageUrl'];
          cars.addAll(jsonData.map((e) => FavoriteModel.fromJson(e)).toList());
          log("data $tr");
          initializeCars(cars);
          update();
        });
      } else {
        paginationStatusRequest = StatusRequest.none;
        update();
      }
    }
    gettingData = false;
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    initializeData();
    super.onInit();
  }
}
