class TopCarModel {
  TopCarModel({
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
  late final Vendor vendor;

  TopCarModel.fromJson(Map<String, dynamic> json) {
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
    _data['vendor'] = vendor.toJson();
    return _data;
  }
}

class Vendor {
  Vendor({
    required this.id,
    required this.photo,
    required this.email,
    required this.phone,
    required this.username,
    required this.showEmailAddresss,
    required this.showPhoneNumber,
    required this.showContactForm,
    required this.totalCars,
  });
  late final int id;
  late final String photo;
  late final String email;
  late final String phone;
  late final String username;
  late final bool showEmailAddresss;
  late final bool showPhoneNumber;
  late final bool showContactForm;
  late final int totalCars;

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    showEmailAddresss = json['show_email_addresss'];
    showPhoneNumber = json['show_phone_number'];
    showContactForm = json['show_contact_form'];
    totalCars = json['total_cars'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['photo'] = photo;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['username'] = username;
    _data['show_email_addresss'] = showEmailAddresss;
    _data['show_phone_number'] = showPhoneNumber;
    _data['show_contact_form'] = showContactForm;
    _data['total_cars'] = totalCars;
    return _data;
  }
}
