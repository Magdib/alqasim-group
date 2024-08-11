import 'package:proj/local/modules/home/controller/main_page_controller.dart';

class FilteredCarsModel {
  final List<CarModel> cars;
  final String filterTitle;

  FilteredCarsModel({
    required this.cars,
    required this.filterTitle,
  });
}
