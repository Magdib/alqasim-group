import 'api/favorite_model.dart';

class FilteredCarsModel {
  final List<FavoriteModel> cars;
  final String filterTitle;
  final List<bool> isLoadingList;
  FilteredCarsModel(
      {required this.cars,
      required this.filterTitle,
      required this.isLoadingList});
}
