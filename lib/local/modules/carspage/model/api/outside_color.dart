class OutsideColorModel {
  String? outsideColor;

  OutsideColorModel({this.outsideColor});

  OutsideColorModel.fromJson(Map<String, dynamic> json) {
    this.outsideColor = json["outside_color"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["outside_color"] = this.outsideColor;
    return data;
  }
}
