import 'package:proj/local/modules/carsdetails/model/api/car_model.dart';
import 'package:proj/local/modules/home/model/api/categories_model.dart';

class SellerModel {
  dynamic vendor;
  List<CategoriesModel>? categories;
  List<VendorCarModel>? allCars;
  VendorInfo? vendorInfo;
  int? totalCarsCount;
  late final VendorPagination vendorPagination;
  SellerModel(
      {this.vendor,
      this.vendorInfo,
      this.categories,
      this.allCars,
      required this.vendorPagination});

  SellerModel.fromJson(Map<String, dynamic> json) {
    json["vendor"]['username'] == "admin"
        ? this.vendor =
            json["vendor"] == null ? null : AdminVendor.fromJson(json["vendor"])
        : this.vendor =
            json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]);
    if (json["vendor"]['username'] != "admin") {
      this.vendorInfo = json["vendor_info"] == null
          ? null
          : VendorInfo.fromJson(json["vendor_info"]);
    }
    this.categories = json["categories"] == null
        ? null
        : (json["categories"] as List)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();
    this.allCars = json["all_cars"] == null
        ? null
        : (json["all_cars"] as List)
            .map((e) => VendorCarModel.fromJson(e))
            .toList();
    this.totalCarsCount =
        json["total_cars_count"] == null ? null : json["total_cars_count"];
    this.vendorPagination = VendorPagination.fromJson(json['pagination']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vendor != null) data["vendor"] = this.vendor?.toJson();
    if (this.categories != null)
      data["categories"] = this.categories?.map((e) => e.toJson()).toList();
    if (this.allCars != null)
      data["all_cars"] = this.allCars?.map((e) => e.toJson()).toList();
    return data;
  }
}

class AdminVendor {
  int? id;
  String? roleId;
  String? firstName;
  String? lastName;
  String? image;
  String? username;
  String? email;
  String? address;
  String? details;
  int? status;
  String? createdAt;
  String? updatedAt;

  AdminVendor(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.image,
      this.username,
      this.email,
      this.address,
      this.details,
      this.status,
      this.createdAt,
      this.updatedAt});

  AdminVendor.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.roleId = json["role_id"];
    this.firstName = json["first_name"];
    this.lastName = json["last_name"];
    this.image = json["image"];
    this.username = json["username"];
    this.email = json["email"];
    this.address = json["address"];
    this.details = json["details"];
    this.status = json["status"];
    this.createdAt = json["created_at"];
    this.updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["role_id"] = this.roleId;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["image"] = this.image;
    data["username"] = this.username;
    data["email"] = this.email;
    data["address"] = this.address;
    data["details"] = this.details;
    data["status"] = this.status;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}

class VendorCarModel {
  VendorCarModel({
    required this.id,
    required this.price,
    required this.priceFormat,
    required this.symbolPrice,
    required this.featureImage,
    required this.previousPrice,
    required this.speed,
    required this.year,
    required this.mileage,
    required this.isFeatured,
    required this.specification,
    required this.status,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.exterior,
    required this.interior,
    required this.brand,
    required this.model,
    required this.productTitle,
    this.categoryForList,
    required this.categoryForDetails,
    required this.vendor,
  });
  late final int id;
  late final int price;
  late final String priceFormat;
  late final String symbolPrice;
  late final String featureImage;
  late final int previousPrice;
  late final String speed;
  late final String year;
  late final String mileage;
  late final bool isFeatured;
  late final String specification;
  late final bool status;
  late final String address;
  late final String latitude;
  late final String longitude;
  late final String exterior;
  late final String interior;
  late final String brand;
  late final String model;
  late final String productTitle;
  late final Null categoryForList;
  late final String categoryForDetails;
  late final Vendor vendor;

  VendorCarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    priceFormat = json['price_format'];
    symbolPrice = json['symbol_price'];
    featureImage = json['feature_image'];
    previousPrice = json['previous_price'];
    speed = json['speed'];
    year = json['year'];
    mileage = json['mileage'];
    isFeatured = json['is_featured'];
    specification = json['specification'];
    status = json['status'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    exterior = json['exterior'];
    interior = json['interior'];
    brand = json['brand'];
    model = json['model'];
    productTitle = json['product_title'];
    categoryForList = null;
    categoryForDetails = json['category_for_details'];
    vendor = Vendor.fromJson(json['vendor']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['price_format'] = priceFormat;
    _data['symbol_price'] = symbolPrice;
    _data['feature_image'] = featureImage;
    _data['previous_price'] = previousPrice;
    _data['speed'] = speed;
    _data['year'] = year;
    _data['mileage'] = mileage;
    _data['is_featured'] = isFeatured;
    _data['specification'] = specification;
    _data['status'] = status;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['exterior'] = exterior;
    _data['interior'] = interior;
    _data['brand'] = brand;
    _data['model'] = model;
    _data['product_title'] = productTitle;
    _data['category_for_list'] = categoryForList;
    _data['category_for_details'] = categoryForDetails;
    _data['vendor'] = vendor.toJson();
    return _data;
  }
}

class VendorInfo {
  int? id;
  int? vendorId;
  String? name;
  String? shopName;
  String? country;
  String? city;
  String? state;
  String? zipCode;
  String? address;
  String? details;

  VendorInfo(
      {this.id,
      this.vendorId,
      this.name,
      this.shopName,
      this.country,
      this.city,
      this.state,
      this.zipCode,
      this.address,
      this.details});

  VendorInfo.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.vendorId = json["vendor_id"];
    this.name = json["name"];
    this.shopName = json["shop_name"];
    this.country = json["country"];
    this.city = json["city"];
    this.state = json["state"];
    this.zipCode = json["zip_code"];
    this.address = json["address"];
    this.details = json["details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["vendor_id"] = this.vendorId;
    data["name"] = this.name;
    data["shop_name"] = this.shopName;
    data["country"] = this.country;
    data["city"] = this.city;
    data["state"] = this.state;
    data["zip_code"] = this.zipCode;
    data["address"] = this.address;
    data["details"] = this.details;
    return data;
  }
}

class VendorPagination {
  int? currentPage;
  int? perPage;
  int? total;
  int? lastPage;

  VendorPagination({this.currentPage, this.perPage, this.total, this.lastPage});

  VendorPagination.fromJson(Map<String, dynamic> json) {
    this.currentPage = json["current_page"];
    this.perPage = json["per_page"];
    this.total = json["total"];
    this.lastPage = json["last_page"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["current_page"] = this.currentPage;
    data["per_page"] = this.perPage;
    data["total"] = this.total;
    data["last_page"] = this.lastPage;
    return data;
  }
}
