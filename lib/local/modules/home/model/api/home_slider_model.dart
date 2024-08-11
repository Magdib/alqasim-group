class HomeSliderModel {
  HomeSliderModel({
    required this.id,
    required this.backgroundImage,
    required this.title,
    required this.text,
    required this.language,
  });
  late final int id;
  late final String backgroundImage;
  late final String title;
  late final String text;
  late final String language;

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    backgroundImage = json['background_image'];
    title = json['title'];
    text = json['text'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['background_image'] = backgroundImage;
    _data['title'] = title;
    _data['text'] = text;
    _data['language'] = language;
    return _data;
  }
}
