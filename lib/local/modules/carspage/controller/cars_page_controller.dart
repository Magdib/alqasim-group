import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/constant/arguments_names.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/core/routes/routes.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/carspage/controller/filters_controller.dart';
import 'package:proj/local/modules/carspage/data/api/cars_page_data.dart';
import 'package:proj/local/modules/carspage/data/enums/filter_value_types.dart';
import 'package:proj/local/modules/carspage/model/filter_model.dart';
import 'package:proj/local/modules/carspage/model/filter_values_model.dart';

class CarsPageController extends GetxController with FiltersController {
  List<FilterValuesModel> filterValues = [];
  List<FilterModel> filters = [];
  TextEditingController? carTitle;
  TextEditingController? carLocation;
  TextEditingController? lowestPrice;
  TextEditingController? highestPrice;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest paginationStatusRequest = StatusRequest.none;
  ScrollController scrollController = ScrollController();
  List<CarModel> carsView = [];
  changeFilterValue(int index, String selectedValue) {
    filters[index].selectedValue = selectedValue;
    update();
  }

  goToDetailsPage(int carId) {
    Get.toNamed(AppRoutes.carDetailsPageRoute, arguments: {
      ArgumentsNames.selectedLocal: getLanguage().languageCode,
      ArgumentsNames.carId: carId
    });
  }

  onChangeTitle() {
    int filterTitleIndex = filterValues.indexWhere(
      (filter) => filter.title == "Car Title",
    );
    if (filterTitleIndex == -1) {
      filterValues.add(FilterValuesModel(
          value: carTitle!.text,
          filterValueType: FilterValueTypes.fields,
          title: "Car Title"));
      filterTitleIndex = filterValues.length - 1;
      update();
    } else {
      if (carTitle!.text.isNotEmpty) {
        filterValues[filterTitleIndex].value = carTitle!.text;
      } else {
        filterValues.removeAt(filterTitleIndex);
        if (filterValues.isNotEmpty) {
          filterCars();
        }
      }
      update();
    }
  }

  brandCheckValue(int index, bool value) {
    brands[index].value = value;
    update();
  }

  handleFilters() async {
    filterValues = [];
    for (int i = 0; i < filters.length; i++) {
      if (filters[i].selectedValue != null &&
          filters[i].selectedValue != "الجميع".tr) {
        filterValues.add(FilterValuesModel(
            value: filters[i].selectedValue!,
            filterValueType: FilterValueTypes.dropDown,
            title: filters[i].filterName));
      }
    }
    for (int i = 0; i < brands.length; i++) {
      if (brands[i].value == true) {
        filterValues.add(FilterValuesModel(
            value: brands[i].title,
            filterValueType: FilterValueTypes.checkBox,
            title: brands[i].title));
      }
    }
    if (carTitle!.text.isNotEmpty &&
        filterValues.indexWhere(
              (filter) => filter.title == "Car Title",
            ) ==
            -1) {
      filterValues.add(FilterValuesModel(
          value: carTitle!.text,
          filterValueType: FilterValueTypes.fields,
          title: "Car Title"));
    }

    if (carLocation!.text.isNotEmpty) {
      filterValues.add(FilterValuesModel(
          value: carLocation!.text,
          filterValueType: FilterValueTypes.fields,
          title: "Car Location"));
    }

    if (lowestPrice!.text.isNotEmpty) {
      filterValues.add(FilterValuesModel(
          value: lowestPrice!.text,
          filterValueType: FilterValueTypes.lowPrice,
          title: ''));
    }

    if (highestPrice!.text.isNotEmpty) {
      filterValues.add(FilterValuesModel(
          value: highestPrice!.text,
          filterValueType: FilterValueTypes.highPrice,
          title: ''));
    }
    update();
    log(filterValues.length.toString());
    if (filterValues.isNotEmpty) {
      await filterCars();
    }
  }

  handlePop() {
    if (lowestPrice!.text.isNotEmpty && highestPrice!.text.isNotEmpty) {
      if (handleUnWantedSigns(lowestPrice!.text) &&
          handleUnWantedSigns(highestPrice!.text)) {
        if (double.parse(lowestPrice!.text) >
            double.parse(highestPrice!.text)) {
          AppToasts.errorToast("خطأ في السعر");
          lowestPrice!.clear();
          handleFilters();
        }
        {
          handleFilters();
        }
      } else {
        AppToasts.errorToast("صيغة السعر غير صحيحة");
        lowestPrice!.clear();
        highestPrice!.clear();
        handleFilters();
      }
    } else {
      handleFilters();
    }
  }

  bool handleUnWantedSigns(String text) {
    if (text.contains(".") ||
        text.contains(" ") ||
        text.contains(",") ||
        text.contains("-")) {
      return false;
    } else {
      return true;
    }
  }

  deleteFilter(int index) async {
    if (filterValues[index].filterValueType == FilterValueTypes.lowPrice) {
      lowestPrice!.clear();
    } else if (filterValues[index].filterValueType ==
        FilterValueTypes.highPrice) {
      highestPrice!.clear();
    } else if (filterValues[index].filterValueType == FilterValueTypes.fields) {
      if (filterValues[index].title == "Car Title") {
        carTitle!.clear();
      } else {
        carLocation!.clear();
      }
    } else if (filterValues[index].filterValueType ==
        FilterValueTypes.dropDown) {
      int deleteIndex = filters.indexWhere(
        (element) => element.filterName == filterValues[index].title,
      );
      filters[deleteIndex].selectedValue = null;
    } else {
      int deleteIndex = brands.indexWhere(
        (element) => element.title == filterValues[index].title,
      );
      brands[deleteIndex].value = false;
    }
    filterValues.removeAt(index);
    if (filterValues.isNotEmpty) {
      await filterCars();
    } else {
      carsView.clear();
    }
    update();
  }

  initializeData() {
    for (int i = 0; i < filters.length; i++) {
      filters[i].selectedValue = "الجميع".tr;
    }
    for (int i = 0; i < brands.length; i++) {
      brands[i].value = false;
    }
    carTitle == null ? carTitle = TextEditingController() : carTitle!.clear();
    carLocation == null
        ? carLocation = TextEditingController()
        : carLocation!.clear();

    lowestPrice == null
        ? lowestPrice = TextEditingController()
        : lowestPrice!.clear();

    highestPrice == null
        ? highestPrice = TextEditingController()
        : highestPrice!.clear();
    update();
  }

  filterByName() async {
    statusRequest = StatusRequest.loading;
    update();
    CarsPageData carsPageData = CarsPageData(Get.find());
    var response = await carsPageData.filterCars(getLanguage().languageCode,
        title: carTitle!.text);
    response.fold((l) {
      if (l.runtimeType == NetworkError) {
        dialogStatusRequest = StatusRequest.offlineFailure;
      } else {
        dialogStatusRequest = StatusRequest.failure;
      }
      update();
      AppToasts.errorToast(l.message);
    }, (r) {
      List data = r['data'];
      nextPageUrl = r['meta']['nextPageUrl'];
      carsView = data.map((e) => CarModel.fromJson(e)).toList();
      statusRequest = StatusRequest.none;
      update();
    });
  }

  filterCars(
      {String? searchNextPageUrl, bool isAdd = false, String? catId}) async {
    if (statusRequest != StatusRequest.loading) {
      if (isAdd == false) {
        statusRequest = StatusRequest.loading;
        update();
      }
      CarsPageData carsPageData = CarsPageData(Get.find());
      int? categoryId;
      int? cityId;
      int? regionalSpecId;
      int? fuelTypeId;
      int? carConditionId;
      int? transmissionId;
      if (categoriesData.any(
        (cat) => cat.name == filters[0].selectedValue,
      )) {
        categoryId = categoriesData
            .firstWhere((cat) => cat.name == filters[0].selectedValue)
            .id;
      }

      if (citiesData.any(
        (city) => city.name == filters[1].selectedValue,
      )) {
        cityId = citiesData
            .firstWhere((city) => city.name == filters[1].selectedValue)
            .id;
      }

      if (regionalSpecData.any(
        (regionalSpec) => regionalSpec.name == filters[2].selectedValue,
      )) {
        regionalSpecId = regionalSpecData
            .firstWhere(
                (regionalSpec) => regionalSpec.name == filters[2].selectedValue)
            .id;
      }

      if (fuelTypeData.any(
        (fuelType) => fuelType.name == filters[10].selectedValue,
      )) {
        fuelTypeId = fuelTypeData
            .firstWhere(
                (fuelType) => fuelType.name == filters[10].selectedValue)
            .id;
      }

      if (carConditionData.any(
        (carCondition) => carCondition.name == filters[12].selectedValue,
      )) {
        carConditionId = carConditionData
            .firstWhere((carCondition) =>
                carCondition.name == filters[12].selectedValue)
            .id;
      }

      if (transmissionData.any(
        (transmissionType) =>
            transmissionType.name == filters[11].selectedValue,
      )) {
        transmissionId = transmissionData
            .firstWhere((transmissionType) =>
                transmissionType.name == filters[11].selectedValue)
            .id;
      }
      var response = catId != null
          ? await carsPageData.filterCars(getLanguage().languageCode,
              categoryId: catId)
          : await carsPageData.filterCars(getLanguage().languageCode,
              title: carTitle!.text,
              brands: brands
                  .where(
                    (brand) => brand.value == true,
                  )
                  .toList(),
              categoryId: (categoryId == null ? "" : "$categoryId"),
              cityId: cityId == null ? "" : "$cityId",
              regionalSpecificationId:
                  regionalSpecId == null ? "" : "$regionalSpecId",
              doorsNum: filters[3].selectedValue != "الجميع".tr
                  ? filters[3].selectedValue
                  : "",
              seatNum: filters[4].selectedValue != "الجميع".tr
                  ? filters[4].selectedValue
                  : "",
              insideColor: filters[5].selectedValue != "الجميع".tr
                  ? filters[5].selectedValue
                  : "",
              outsideColor: filters[6].selectedValue != "الجميع".tr
                  ? filters[6].selectedValue
                  : "",
              horsePower: filters[7].selectedValue != "الجميع".tr
                  ? filters[7].selectedValue
                  : "",
              isTested: filters[8].selectedValue != "الجميع".tr
                  ? (filters[8].selectedValue == "لا".tr ? "0" : "1")
                  : "",
              isWarranty: filters[9].selectedValue != "الجميع".tr
                  ? (filters[9].selectedValue == "لا".tr
                      ? "0"
                      : filters[9].selectedValue == "نعم".tr
                          ? "1"
                          : "-1")
                  : "",
              fuelTypeID: fuelTypeId == null ? "" : "$fuelTypeId",
              transmission: transmissionId == null ? "" : "$transmissionId",
              condition: carConditionId == null ? "" : "$carConditionId",
              location: carLocation!.text,
              maxPrice: highestPrice!.text,
              minPrice: lowestPrice!.text,
              nextPageUrl: searchNextPageUrl);
      response.fold((l) {
        if (isAdd == false) {
          if (l.runtimeType == NetworkError) {
            statusRequest = StatusRequest.offlineFailure;
          } else {
            statusRequest = StatusRequest.failure;
          }
        }
        update();
        AppToasts.errorToast(l.message);
      }, (r) {
        List data = r['data'];
        nextPageUrl = r['meta']['nextPageUrl'];
        if (isAdd) {
          carsView.addAll(data.map((e) => CarModel.fromJson(e)).toList());
        } else {
          carsView = data.map((e) => CarModel.fromJson(e)).toList();
        }
        if (catId != null && carsView.isEmpty) {
          AppToasts.successToast("لا يوجد سيارات لعرضها".tr);
        }
        if (isAdd == false) {
          statusRequest = StatusRequest.none;
          update();
        }
      });
    }
  }

  clearData() {
    statusRequest = StatusRequest.none;
    update();
    initializeData();
    filterValues = [];
    filters = [];
    carsView = [];
  }

  handlePagination() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      if (nextPageUrl != null &&
          paginationStatusRequest != StatusRequest.loading) {
        paginationStatusRequest = StatusRequest.loading;
        update();
        await filterCars(searchNextPageUrl: nextPageUrl, isAdd: true);
        paginationStatusRequest = StatusRequest.none;
        update();
      }
    }
  }

  getData([bool isRefresh = false]) async {
    if (isRefresh) {
      dialogStatusRequest = StatusRequest.loading;
      update();
    }
    if (await getCategoriesData()) {
      if (await getCitiesData() == true) {
        if (await getRegionalSpecData() == true) {
          if (await getDoorsNumberData() == true) {
            if (await getSeatsNumberData() == true) {
              if (await getInsideColorData() == true) {
                if (await getOutsideColorData() == true) {
                  if (await getHorsePowerData() == true) {
                    if (filters.any(
                          (filter) => filter.filterName == "مجربة".tr,
                        ) ==
                        false) {
                      filters.add(
                        FilterModel(
                            filterName: "مجربة".tr,
                            filterValues: ["الجميع".tr, "لا".tr, "نعم".tr],
                            selectedValue: "الجميع".tr),
                      );
                    }
                    if (filters.any(
                          (filter) => filter.filterName == "التأمين".tr,
                        ) ==
                        false) {
                      filters.add(FilterModel(
                          filterName: "التأمين".tr,
                          filterValues: [
                            "الجميع".tr,
                            "نعم".tr,
                            "لا".tr,
                            "غير قابل للتنفيذ".tr
                          ],
                          selectedValue: "الجميع".tr));
                    }
                    if (await getFuelTypeData() == true) {
                      if (await getTransmissionTypeData() == true) {
                        if (await getCarConditionData() == true) {
                          await getBrandsData();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  @override
  void onReady() {
    scrollController
      ..addListener(
        () => handlePagination(),
      );
    initializeData();
    getData(false);
    log("Hello");
    super.onReady();
  }
}
