class DrawerModel {
  final String title;
  final String? route;
  final String? link;
  final int? index;
  final bool? isDropDown;
  DrawerModel(
      {required this.title,
      this.link,
      this.route,
      this.isDropDown,
      this.index});
}
