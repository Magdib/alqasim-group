import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/carspage/model/api/seller_model.dart';
import 'package:proj/local/modules/carspage/model/seller_cat_cars_model.dart';
import 'package:proj/local/modules/home/model/api/categories_model.dart';

import '../data/api/seller_page_data.dart';

class SellerPageController extends GetxController {
  List<SellerCatCarsModel> catCars = [];
  // late PageController pageController;
  StatusRequest statusRequest = StatusRequest.loading;
  int selectedIndex = 0;
  String vendorName = Get.arguments[ArgumentsNames.vendorName];
  List<VendorCarModel> totalSellerCars = [];
  List<CategoriesModel> sellerCats = [];
  late SellerModel sellerResponseData;
  late dynamic vendorData;
  changeTabView(int index) {
    // pageController.jumpToPage(
    //   index,
    // );

    selectedIndex = index;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    SellerData sellerData = SellerData(Get.find());
    var response = await sellerData.getSellerData(getLanguage().languageCode,
        vendorName, vendorName == "admin" ? true : false);
    response.fold((l) {
      if (l.runtimeType == NetworkError) {
        statusRequest = StatusRequest.offlineFailure;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }, (r) async {
      Map<String, dynamic> data = r['data'];
      sellerResponseData = SellerModel.fromJson(data);
      statusRequest = StatusRequest.none;
      vendorData = sellerResponseData.vendor!;
      totalSellerCars = sellerResponseData.allCars!;
      sellerCats = sellerResponseData.categories!;
      separateCatLists();
      update();
    });
  }

  separateCatLists() {
    List<int> catsToDelete = [];
    for (int i = 0; i < sellerCats.length; i++) {
      List<VendorCarModel> thisCatCars = totalSellerCars
          .where(
            (carList) => carList.categoryForDetails == sellerCats[i].name,
          )
          .toList();
      if (thisCatCars.isNotEmpty) {
        catCars.add(SellerCatCarsModel(
            cars: thisCatCars, categoryName: sellerCats[i].name));
      } else {
        catsToDelete.add(i);
      }
    }
    if (catsToDelete.isNotEmpty) {
      for (int i = catsToDelete.length - 1; i == 0; i--) {
        sellerCats.remove(sellerCats[catsToDelete[i]]);
      }
    }
  }

  @override
  void onInit() {
    // pageController = PageController();
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }
}
