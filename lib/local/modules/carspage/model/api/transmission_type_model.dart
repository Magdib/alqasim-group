class TransmissionTypeModel {
  int? id;
  String? name;

  TransmissionTypeModel({this.id, this.name});

  TransmissionTypeModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}
