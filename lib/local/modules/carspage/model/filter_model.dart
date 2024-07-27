class FilterModel {
  final String filterName;
  final List<String> filterValues;
  String? selectedValue;

  FilterModel(
      {required this.filterName,
      required this.filterValues,
      this.selectedValue});
}
