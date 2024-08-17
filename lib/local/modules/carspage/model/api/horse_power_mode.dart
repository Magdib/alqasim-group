class HorsePowerModel {
  String? horsePower;

  HorsePowerModel({this.horsePower});

  HorsePowerModel.fromJson(Map<String, dynamic> json) {
    this.horsePower = json["horse_power"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["horse_power"] = this.horsePower;
    return data;
  }
}
