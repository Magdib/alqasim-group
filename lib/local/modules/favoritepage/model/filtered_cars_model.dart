import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';

class FilteredCarsModel {
  final List<CarModel> cars;
  final String filterTitle;

  FilteredCarsModel({
    required this.cars,
    required this.filterTitle,
  });
}
