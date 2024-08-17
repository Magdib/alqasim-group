class CarModel {
  CarModel({
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
    required this.images,
    required this.categoryForDetails,
    required this.description,
    required this.fuelType,
    required this.transmissionType,
    required this.city,
    required this.regionalSpecifications,
    required this.isTested,
    required this.doorNum,
    required this.seatNum,
    required this.cylinderNum,
    required this.insideColor,
    required this.outsideColor,
    required this.isWarranty,
    required this.vendor,
    required this.relatedCars,
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
  late final List<Images> images;
  late final String categoryForDetails;
  String? categoryForList;
  late final String description;
  late final String fuelType;
  late final String transmissionType;
  late final String city;
  late final String regionalSpecifications;
  late final bool isTested;
  late final String doorNum;
  late final String seatNum;
  late final String cylinderNum;
  late final String insideColor;
  late final String outsideColor;
  late final String isWarranty;
  late final Vendor vendor;
  late final List<RelatedCars> relatedCars;

  CarModel.fromJson(Map<String, dynamic> json) {
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
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    categoryForDetails = json['category_for_details'];
    categoryForList = json["category_for_list"];
    description = json['description'];
    fuelType = json['fuel_type'];
    transmissionType = json['transmission_type'];
    city = json['city'];
    regionalSpecifications = json['regional_specifications'];
    isTested = json['is_tested'];
    doorNum = json['door_num'];
    seatNum = json['seat_num'];
    cylinderNum = json['cylinder_num'];
    insideColor = json['inside_color'];
    outsideColor = json['outside_color'];
    isWarranty = json['is_warranty'];
    vendor = Vendor.fromJson(json['vendor']);
    relatedCars =json['related_cars'] == null ?[]: List.from(json['related_cars'])
        .map((e) => RelatedCars.fromJson(e))
        .toList(); 
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
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['category_for_details'] = categoryForDetails;
    _data["category_for_list"] = categoryForList;
    _data['description'] = description;
    _data['fuel_type'] = fuelType;
    _data['transmission_type'] = transmissionType;
    _data['city'] = city;
    _data['regional_specifications'] = regionalSpecifications;
    _data['is_tested'] = isTested;
    _data['door_num'] = doorNum;
    _data['seat_num'] = seatNum;
    _data['cylinder_num'] = cylinderNum;
    _data['inside_color'] = insideColor;
    _data['outside_color'] = outsideColor;
    _data['is_warranty'] = isWarranty;
    _data['vendor'] = vendor.toJson();
    _data['related_cars'] = relatedCars.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Images {
  Images({
    required this.id,
    required this.carId,
    required this.image,
  });
  late final int id;
  late final int carId;
  late final String image;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['car_id'] = carId;
    _data['image'] = image;
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

class RelatedCars {
  RelatedCars({
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

  RelatedCars.fromJson(Map<String, dynamic> json) {
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
