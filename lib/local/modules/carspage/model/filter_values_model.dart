import 'package:proj/local/modules/carspage/data/enums/filter_value_types.dart';

class FilterValuesModel {
  String value;
  final FilterValueTypes filterValueType;
  final String title;
  final String? id;
  FilterValuesModel({
    required this.value,
    required this.filterValueType,
    required this.title,
    this.id,
  });
}
