class BrandsModel {
  int? id;
  String? name;
  String? image;
  String? slug;
  bool? status;
  String? serialNumber;
  String? language;

  BrandsModel(
      {this.id,
      this.name,
      this.image,
      this.slug,
      this.status,
      this.serialNumber,
      this.language});

  BrandsModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.image = json["image"];
    this.slug = json["slug"];
    this.status = json["status"];
    this.serialNumber = json["serial_number"];
    this.language = json["language"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["image"] = this.image;
    data["slug"] = this.slug;
    data["status"] = this.status;
    data["serial_number"] = this.serialNumber;
    data["language"] = this.language;
    return data;
  }
}
