import 'dart:developer';

import 'package:get/get.dart';
import 'package:proj/global/core/api/api_errors.dart';
import 'package:proj/global/core/api/status_request.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/core/functions/language/get_language.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/carspage/model/api/brands_model.dart';
import 'package:proj/local/modules/carspage/model/api/car_condition.dart';
import 'package:proj/local/modules/carspage/model/api/city_model.dart';
import 'package:proj/local/modules/carspage/model/api/doors_number_model.dart';
import 'package:proj/local/modules/carspage/model/api/fuel_type.dart';
import 'package:proj/local/modules/carspage/model/api/horse_power_mode.dart';
import 'package:proj/local/modules/carspage/model/api/inside_color_model.dart';
import 'package:proj/local/modules/carspage/model/api/outside_color.dart';
import 'package:proj/local/modules/carspage/model/api/regional_spec_model.dart';
import 'package:proj/local/modules/carspage/model/api/seats_number_model.dart';
import 'package:proj/local/modules/carspage/model/api/transmission_type_model.dart';
import 'package:proj/local/modules/carspage/model/brand_filter_model.dart';
import 'package:proj/local/modules/carspage/model/filter_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';
import 'package:proj/local/modules/home/data/home_data.dart';
import 'package:proj/local/modules/home/model/api/categories_model.dart';

import '../data/api/cars_page_data.dart';

mixin FiltersController on GetxController {
  StatusRequest dialogStatusRequest = StatusRequest.loading;
  List<CarModel> carsView = [];
  List<FilterModel> filters = [];
  List<BrandFilterModel> brands = [];
  List<CityModel> citiesData = [];
  List<CategoriesModel> categoriesData = [];
  List<RegionalSpecModel> regionalSpecData = [];
  List<FuelTypeModel> fuelTypeData = [];
  List<BrandsModel> carsBrandData = [];
  List<CarConditionModel> carConditionData = [];
  List<TransmissionTypeModel> transmissionData = [];
  String? nextPageUrl;
  Future<bool> getCategoriesData() async {
    if (filters.any(
          (filter) => filter.filterName == "فئة".tr,
        ) ==
        false) {
      HomeData homeData = HomeData(Get.find());
      var categoriesResponse = await homeData
          .getCategoriesData(getLanguage().languageCode, withPagination: false);
      categoriesResponse.fold((l) {
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();

        AppToasts.errorToast(l.message);
        return false;
      }, (r) async {
        List jsonData = r['data'];
        categoriesData =
            jsonData.map((e) => CategoriesModel.fromJson(e)).toList();
        List<String> categories = [];
        categories.add("الجميع".tr);
        for (int i = 0; i < categoriesData.length; i++) {
          categories.add(categoriesData[i].name);
        }
        filters.add(
          FilterModel(
            filterName: "فئة".tr,
            filterValues: categories,
          ),
        );
        return true;
      });
    }
    return true;
  }

  Future<bool> getCitiesData() async {
    if (filters.any(
          (filter) => filter.filterName == "مدينة".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response = await carsPageData.getCitesApi(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        log("data $data");
        citiesData = data.map((e) => CityModel.fromJson(e)).toList();
        List<String> cities = [];
        cities.add("الجميع".tr);
        for (int i = 0; i < citiesData.length; i++) {
          cities.add(citiesData[i].name!);
        }
        filters.add(FilterModel(
          filterName: "مدينة".tr,
          filterValues: cities,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getRegionalSpecData() async {
    if (filters.any(
          (filter) => filter.filterName == "المواصفات الإقليمية".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getRegionalSpecApi(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        regionalSpecData =
            data.map((e) => RegionalSpecModel.fromJson(e)).toList();
        List<String> regionalSpec = [];
        regionalSpec.add("الجميع".tr);
        for (int i = 0; i < regionalSpecData.length; i++) {
          regionalSpec.add(regionalSpecData[i].name!);
        }
        filters.add(FilterModel(
          filterName: "المواصفات الإقليمية".tr,
          filterValues: regionalSpec,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getDoorsNumberData() async {
    if (filters.any(
          (filter) => filter.filterName == "عدد الأبواب".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getDoorsNumber(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        List<DoorsNumberModel> doorsNumberData =
            data.map((e) => DoorsNumberModel.fromJson(e)).toList();
        List<String> doorsNumber = [];
        doorsNumber.add("الجميع".tr);
        for (int i = 0; i < doorsNumberData.length; i++) {
          doorsNumber.add(doorsNumberData[i].doorNum!);
        }
        filters.add(FilterModel(
          filterName: "عدد الأبواب".tr,
          filterValues: doorsNumber,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getSeatsNumberData() async {
    if (filters.any(
          (filter) => filter.filterName == "عدد المقاعد".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getSeatsNumber(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        List<SeatsNumberModel> seatsNumberData =
            data.map((e) => SeatsNumberModel.fromJson(e)).toList();
        List<String> seatsNumber = [];
        seatsNumber.add("الجميع".tr);
        for (int i = 0; i < seatsNumberData.length; i++) {
          seatsNumber.add(seatsNumberData[i].seatNum!);
        }
        filters.add(FilterModel(
          filterName: "عدد المقاعد".tr,
          filterValues: seatsNumber,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getInsideColorData() async {
    if (filters.any(
          (filter) => filter.filterName == "اللون الداخلي".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getInsideColor(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        List<InsideColorModel> insideColorData =
            data.map((e) => InsideColorModel.fromJson(e)).toList();
        List<String> insideColor = [];
        insideColor.add("الجميع".tr);
        for (int i = 0; i < insideColorData.length; i++) {
          insideColor.add(insideColorData[i].insideColor!);
        }
        filters.add(FilterModel(
          filterName: "اللون الداخلي".tr,
          filterValues: insideColor,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getOutsideColorData() async {
    if (filters.any(
          (filter) => filter.filterName == "اللون الخارجي".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getOutsideColor(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        List<OutsideColorModel> outsideColorData =
            data.map((e) => OutsideColorModel.fromJson(e)).toList();
        List<String> outsideColor = [];
        outsideColor.add("الجميع".tr);
        for (int i = 0; i < outsideColorData.length; i++) {
          outsideColor.add(outsideColorData[i].outsideColor!);
        }
        filters.add(FilterModel(
          filterName: "اللون الخارجي".tr,
          filterValues: outsideColor,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getHorsePowerData() async {
    if (filters.any(
          (filter) => filter.filterName == "قوة الحصان".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getHorsePower(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        List<HorsePowerModel> horsePowerData =
            data.map((e) => HorsePowerModel.fromJson(e)).toList();
        List<String> horsePower = [];
        horsePower.add("الجميع".tr);
        for (int i = 0; i < horsePowerData.length; i++) {
          horsePower.add(horsePowerData[i].horsePower!);
        }
        filters.add(FilterModel(
          filterName: "قوة الحصان".tr,
          filterValues: horsePower,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getFuelTypeData() async {
    if (filters.any(
          (filter) => filter.filterName == "أنواع الوقود".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response = await carsPageData.getFuelType(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        fuelTypeData = data.map((e) => FuelTypeModel.fromJson(e)).toList();
        List<String> fuelType = [];
        fuelType.add("الجميع".tr);
        for (int i = 0; i < fuelTypeData.length; i++) {
          fuelType.add(fuelTypeData[i].name!);
        }
        filters.add(FilterModel(
          filterName: "أنواع الوقود".tr,
          filterValues: fuelType,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getTransmissionTypeData() async {
    if (filters.any(
          (filter) => filter.filterName == "نوع التحويل".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getTransmissionType(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        transmissionData =
            data.map((e) => TransmissionTypeModel.fromJson(e)).toList();
        List<String> transmission = [];
        transmission.add("الجميع".tr);
        for (int i = 0; i < transmissionData.length; i++) {
          transmission.add(transmissionData[i].name!);
        }
        filters.add(FilterModel(
          filterName: "نوع التحويل".tr,
          filterValues: transmission,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getCarConditionData() async {
    if (filters.any(
          (filter) => filter.filterName == "شروط".tr,
        ) ==
        false) {
      CarsPageData carsPageData = CarsPageData(Get.find());
      var response =
          await carsPageData.getCarCondition(getLanguage().languageCode);
      response.fold((l) {
        if (dialogStatusRequest == StatusRequest.loading) {
          AppToasts.errorToast(l.message);
        }
        if (l.runtimeType == NetworkError) {
          dialogStatusRequest = StatusRequest.offlineFailure;
        } else {
          dialogStatusRequest = StatusRequest.failure;
        }
        update();
        return false;
      }, (r) {
        List data = r['data'];
        carConditionData =
            data.map((e) => CarConditionModel.fromJson(e)).toList();
        List<String> carCondition = [];
        carCondition.add("الجميع".tr);
        for (int i = 0; i < carConditionData.length; i++) {
          carCondition.add(carConditionData[i].name!);
        }
        filters.add(FilterModel(
          filterName: "شروط".tr,
          filterValues: carCondition,
        ));
        return true;
      });
    }
    return true;
  }

  Future<bool> getBrandsData() async {
    CarsPageData carsPageData = CarsPageData(Get.find());
    var response = await carsPageData.getBrands(getLanguage().languageCode);
    response.fold((l) {
      if (dialogStatusRequest == StatusRequest.loading) {
        AppToasts.errorToast(l.message);
      }
      if (l.runtimeType == NetworkError) {
        dialogStatusRequest = StatusRequest.offlineFailure;
      } else {
        dialogStatusRequest = StatusRequest.failure;
      }
      update();
      return false;
    }, (r) {
      List data = r['data'];
      carsBrandData = data.map((e) => BrandsModel.fromJson(e)).toList();
      brands.clear();
      for (int i = 0; i < carsBrandData.length; i++) {
        brands.add(BrandFilterModel(
            title: carsBrandData[i].name!, id: carsBrandData[i].id!));
      }
      dialogStatusRequest = StatusRequest.none;
      update();
      return true;
    });
    return false;
  }
}
