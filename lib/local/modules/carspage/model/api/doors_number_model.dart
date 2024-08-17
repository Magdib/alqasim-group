class DoorsNumberModel {
  String? doorNum;

  DoorsNumberModel({this.doorNum});

  DoorsNumberModel.fromJson(Map<String, dynamic> json) {
    this.doorNum = json["door_num"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["door_num"] = this.doorNum;
    return data;
  }
}
