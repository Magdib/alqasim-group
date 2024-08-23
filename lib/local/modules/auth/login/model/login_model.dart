import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 3)
class LoginModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? image;
  @HiveField(5)
  String? backgroundImage;
  @HiveField(6)
  bool? status;
  @HiveField(7)
  String? provider;
  @HiveField(8)
  String? providerId;
  @HiveField(9)
  String? phone;
  @HiveField(10)
  String? country;
  @HiveField(11)
  String? city;
  @HiveField(12)
  String? state;
  @HiveField(13)
  String? zipCode;
  @HiveField(14)
  String? address;

  LoginModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.image,
      this.backgroundImage,
      this.status,
      this.provider,
      this.providerId,
      this.phone,
      this.country,
      this.city,
      this.state,
      this.zipCode,
      this.address});

  LoginModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.username = json["username"];
    this.email = json["email"];
    this.image = json["image"];
    this.backgroundImage = json["background_image"];
    this.status = json["status"];
    this.provider = json["provider"];
    this.providerId = json["provider_id"];
    this.phone = json["phone"];
    this.country = json["country"];
    this.city = json["city"];
    this.state = json["state"];
    this.zipCode = json["zip_code"];
    this.address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["username"] = this.username;
    data["email"] = this.email;
    data["image"] = this.image;
    data["background_image"] = this.backgroundImage;
    data["status"] = this.status;
    data["provider"] = this.provider;
    data["provider_id"] = this.providerId;
    data["phone"] = this.phone;
    data["country"] = this.country;
    data["city"] = this.city;
    data["state"] = this.state;
    data["zip_code"] = this.zipCode;
    data["address"] = this.address;
    return data;
  }
}
