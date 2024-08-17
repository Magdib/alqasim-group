class RegionalSpecModel {
  int? id;
  String? name;
  String? slug;
  bool? status;
  String? serialNumber;

  RegionalSpecModel(
      {this.id, this.name, this.slug, this.status, this.serialNumber});

  RegionalSpecModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.slug = json["slug"];
    this.status = json["status"];
    this.serialNumber = json["serial_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["slug"] = this.slug;
    data["status"] = this.status;
    data["serial_number"] = this.serialNumber;
    return data;
  }
}
