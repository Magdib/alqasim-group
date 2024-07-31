import 'dart:developer';

import 'package:get/get.dart';
import 'package:proj/local/modules/favoritepage/model/filtered_cars_model.dart';
import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class FavoritePageController extends GetxController {
  List<FilteredCarsModel> viewCars = [];
  List<CarModel> cars = [
    CarModel(
        image: "assets/images/car2.webp",
        price: "234,500 AED",
        type: "بينتلي 2020",
        name: "Bentley",
        category: "قابلة للتحويل",
        user: "admin"),
    CarModel(
        image: "assets/images/car1.webp",
        price: "5,844,480 AED",
        type: "بينتلي 2020",
        category: "قابلة للتحويل",
        name: "Bentley Bentayga Speed",
        user: "admin"),
    CarModel(
        image: "assets/images/car2.webp",
        price: "5,450,480",
        category: "رياضيّة",
        type: "",
        name: "Car Name",
        user: ""),
    CarModel(
      image: "assets/images/car1.webp",
      price: "2,450,480",
      category: "الشاحنات الصغيرة",
      type: "",
      name: "Car Name",
      user: "",
      removeCarWord: true,
    ),
  ];
  filterCars(String value) {
    log("${value.length}");
    if (value.isNotEmpty) {
      List<CarModel> filterCars = cars
          .where((car) => car.name.isCaseInsensitiveContains(value))
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
            removeCarWord: selectedCars[i].removeCarWord));
      }
    }
  }

  @override
  void onInit() {
    initializeCars(cars);
    super.onInit();
  }
}
