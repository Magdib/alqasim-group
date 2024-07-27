import 'package:proj/local/modules/carspage/data/enums/filter_value_types.dart';

class FilterValuesModel {
  final String value;
  final FilterValueTypes filterValueType;
  final String title;
  FilterValuesModel({
    required this.value,
    required this.filterValueType,
    required this.title,
  });
}
