class InsideColorModel {
  String? insideColor;

  InsideColorModel({this.insideColor});

  InsideColorModel.fromJson(Map<String, dynamic> json) {
    this.insideColor = json["inside_color"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["inside_color"] = this.insideColor;
    return data;
  }
}
