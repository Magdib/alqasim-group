import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/global/core/class/app_toast.dart';
import 'package:proj/local/modules/carspage/data/enums/filter_value_types.dart';
import 'package:proj/local/modules/carspage/model/brand_filter_model.dart';
import 'package:proj/local/modules/carspage/model/filter_model.dart';
import 'package:proj/local/modules/carspage/model/filter_values_model.dart';

class CarsPageController extends GetxController {
  List<FilterValuesModel> filterValues = [];
  late List<FilterModel> filters;
  late List<BrandFilterModel> brands;
  TextEditingController? carTitle;
  TextEditingController? carLocation;
  TextEditingController? lowestPrice;
  TextEditingController? highestPrice;

  changeFilterValue(int index, String selectedValue) {
    filters[index].selectedValue = selectedValue;
    update();
  }

  brandCheckValue(int index, bool value) {
    brands[index].value = value;
    update();
  }

  handleFilters() {
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
    if (carTitle!.text.isNotEmpty) {
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

  deleteFilter(int index) {
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
    update();
  }

  initializeData() {
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
    filters = [
      FilterModel(
        filterName: "فئة".tr,
        filterValues: [
          "الجميع",
          "رياضيّة",
          "دفع رباعي",
          "عبور",
          "زوج",
          "قابل للتحويل",
          "سيدان",
          "شاحنة صغيرة",
          "هاتشباك"
        ],
      ),
      FilterModel(
        filterName: "مدينة".tr,
        filterValues: ["الجميع", "الشارقة", "مدينة2"],
      ),
      FilterModel(
        filterName: "المواصفات الإقليمية".tr,
        filterValues: ["الجميع", "GCC Space", "خليجي"],
      ),
      FilterModel(
        filterName: "عدد الأبواب".tr,
        filterValues: ["الجميع", "3", "4"],
      ),
      FilterModel(
        filterName: "عدد المقاعد".tr,
        filterValues: ["الجميع", "4", "6"],
      ),
      FilterModel(
        filterName: "اللون الداخلي".tr,
        filterValues: ["الجميع", "بني", "أحمر"],
      ),
      FilterModel(
        filterName: "اللون الخارجي".tr,
        filterValues: ["الجميع", "أسود", "ذهبي"],
      ),
      FilterModel(
        filterName: "قوة الحصان".tr,
        filterValues: ["الجميع", "300-399", "700-799"],
      ),
      FilterModel(
          filterName: "مجربة".tr,
          filterValues: ["الجميع", "لا", "نعم"],
          selectedValue: "الجميع"),
      FilterModel(
          filterName: "التأمين".tr,
          filterValues: ["الجميع", "نعم", "لا"],
          selectedValue: "الجميع"),
      FilterModel(
        filterName: "أنواع الوقود".tr,
        filterValues: [
          "الجميع",
          "بنزين",
          "ديزل",
          "هجين",
          "كهربائي",
          "وقود حيوي"
        ],
      ),
      FilterModel(
        filterName: "شروط".tr,
        filterValues: ["الجميع", "300-399", "700-799"],
      ),
    ];
    brands = [
      BrandFilterModel(
        title: "تويوتا",
      ),
      BrandFilterModel(
        title: "معقل",
      ),
      BrandFilterModel(
        title: "هوندا",
      ),
      BrandFilterModel(
        title: "رانج روفر",
      ),
      BrandFilterModel(
        title: "نيسان",
      ),
      BrandFilterModel(
        title: "بي ام دبليو",
      ),
      BrandFilterModel(
        title: "أودي",
      ),
      BrandFilterModel(
        title: "بينتلي",
      ),
      BrandFilterModel(title: "رولز رايز"),
    ];
    update();
  }
}
