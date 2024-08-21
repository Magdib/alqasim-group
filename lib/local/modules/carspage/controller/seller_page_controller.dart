import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/functions/wishlist/add_to_wishlist.dart';
import 'package:proj/local/modules/carspage/model/api/seller_model.dart';
import 'package:proj/local/modules/carspage/model/seller_cat_cars_model.dart';
import 'package:proj/local/modules/home/model/api/categories_model.dart';

import '../data/api/seller_page_data.dart';

class SellerPageController extends GetxController {
  List<SellerCatCarsModel> catCars = [];
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest paginationStatusRequest = StatusRequest.none;
  int selectedIndex = 0;
  String vendorName = Get.arguments[ArgumentsNames.vendorName];
  VendorPagination? vendorPagination;
  List<VendorCarModel> totalSellerCars = [];
  List<CategoriesModel> sellerCats = [];
  List<bool> wishlistLoadingList = [];
  late SellerModel sellerResponseData;
  late dynamic vendorData;
  changeTabView(int index) {
    // pageController.jumpToPage(
    //   index,
    // );
    handleWishListLoading(index);
    selectedIndex = index;
    update();
  }

  handleWishListLoading(int index) {
    wishlistLoadingList.clear();
    if (index != 0) {
      for (int i = 0; i < catCars[index - 1].cars.length; i++) {
        wishlistLoadingList.add(false);
      }
    } else {
      for (int i = 0; i < totalSellerCars.length; i++) {
        wishlistLoadingList.add(false);
      }
    }
  }

  handleWishlist(int index) async {
    wishlistLoadingList[index] = true;
    update();
    if (selectedIndex == 0) {
      // await removeFromWishList(topCars[index].id.toString());
      await addToWishList(totalSellerCars[index].id.toString());
    } else {
      // await removeFromWishList(topCars[index].id.toString());
      await addToWishList(catCars[selectedIndex].cars[index].id.toString());
    }
    wishlistLoadingList[index] = false;
    update();
  }

  handlePagination() async {
    if (vendorPagination!.currentPage != vendorPagination!.lastPage) {
      await getData(true);
    }
  }

  getData(bool isPagination) async {
    if (isPagination == false) {
      statusRequest = StatusRequest.loading;
    } else {
      paginationStatusRequest = StatusRequest.loading;
    }
    update();
    String? nextPage;
    if (vendorPagination != null) {
      if (vendorPagination!.currentPage != vendorPagination!.lastPage) {
        nextPage = "${vendorPagination!.currentPage! + 1}";
      }
    }
    SellerData sellerData = SellerData(Get.find());
    var response = await sellerData.getSellerData(getLanguage().languageCode,
        vendorName, vendorName == "admin" ? true : false,
        page: nextPage);
    response.fold((l) {
      if (isPagination == false) {
        if (l.runtimeType == NetworkError) {
          statusRequest = StatusRequest.offlineFailure;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        paginationStatusRequest = StatusRequest.none;
        AppToasts.errorToast("حدث خطأ ما...".tr);
      }
      update();
    }, (r) async {
      Map<String, dynamic> data = r['data'];
      sellerResponseData = SellerModel.fromJson(data);
      statusRequest = StatusRequest.none;
      paginationStatusRequest = StatusRequest.none;
      vendorData = sellerResponseData.vendor!;
      if (totalSellerCars.isEmpty) {
        totalSellerCars = sellerResponseData.allCars!;
      } else {
        totalSellerCars.addAll(sellerResponseData.allCars!);
      }
      sellerCats = sellerResponseData.categories!;
      vendorPagination = sellerResponseData.vendorPagination;
      separateCatLists();
      update();
    });
  }

  separateCatLists() {
    List<int> catsToDelete = [];
    catCars.clear();
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
    handleWishListLoading(selectedIndex);
  }

  @override
  void onInit() {
    // pageController = PageController();
    getData(false);
    super.onInit();
  }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }
}
