import 'dart:developer';

import 'package:get/get.dart';
import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/favoritepage/model/filtered_cars_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class FavoritePageController extends GetxController {
  List<FilteredCarsModel> viewCars = [];
  List<CarModel> cars = [];

  filterCars(String value) {
    log("${value.length}");
    if (value.isNotEmpty) {
      List<CarModel> filterCars = cars
          .where((car) => car.productTitle.isCaseInsensitiveContains(value))
          .toList();
      initializeCars(filterCars);
    } else {
      initializeCars(cars);
    }
    update();
  }

  initializeCars(List<CarModel> selectedCars) {
    viewCars.clear();
    for (int i = 0; i < selectedCars.length; i++) {
      int categoryIndex = viewCars.indexWhere(
        (viewCars) => viewCars.filterTitle == selectedCars[i].category,
      );
      if (categoryIndex != -1) {
        viewCars[categoryIndex].cars.add(selectedCars[i]);
      } else {
        viewCars.add(FilteredCarsModel(
          cars: [selectedCars[i]],
          filterTitle: selectedCars[i].category!,
        ));
      }
    }
  }

  @override
  void onInit() {
    initializeCars(cars);
    super.onInit();
  }
}
