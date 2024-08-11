class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.status,
    required this.serialNumber,
    required this.language,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String slug;
  late final bool status;
  late final String serialNumber;
  late final String language;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    slug = json['slug'];
    status = json['status'];
    serialNumber = json['serial_number'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['slug'] = slug;
    _data['status'] = status;
    _data['serial_number'] = serialNumber;
    _data['language'] = language;
    return _data;
  }
}
