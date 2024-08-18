import 'package:hive/hive.dart';

part 'login_model.g.dart';

@HiveType(typeId: 2)
class LoginModel {
  LoginModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.image,
    required this.status,
    required this.provider,
    required this.providerId,
    required this.phone,
    required this.country,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.address,
  });
  @HiveField(0)
  late final int id;

  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String username;
  @HiveField(3)
  late final String email;
  @HiveField(4)
  late final String image;
  @HiveField(5)
  late final bool status;
  @HiveField(6)
  late final String provider;
  @HiveField(7)
  late final String providerId;
  @HiveField(8)
  late final String phone;
  @HiveField(9)
  late final String country;
  @HiveField(10)
  late final String city;
  @HiveField(11)
  late final String state;
  @HiveField(12)
  late final String zipCode;
  @HiveField(13)
  late final String address;

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
    status = json['status'];
    provider = json['provider'];
    providerId = json['provider_id'];
    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['image'] = image;
    _data['status'] = status;
    _data['provider'] = provider;
    _data['provider_id'] = providerId;
    _data['phone'] = phone;
    _data['country'] = country;
    _data['city'] = city;
    _data['state'] = state;
    _data['zip_code'] = zipCode;
    _data['address'] = address;
    return _data;
  }
}
