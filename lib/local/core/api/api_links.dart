class ApiLinks {
  static Map<String, String> header = {
    "Accept": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    // 'Authorization': "Bearer ${AppServices.token}",
  };

  static const String serverLink =
      'https://www.flexilitecompany.com/al_qassim_project/public/api';
  //end point

  //Home
  static const String sliderApi = "$serverLink/car/sliders";
  static const String categoriesApi = '$serverLink/car/categories';
  static const String topCarsApi = "$serverLink/car/top_cars";
  static const String addFirebaseTokenApi = "$serverLink/add_firebase_token";

  //Details
  static const String carDetailsApi = "$serverLink/car/details/";
  static const String sendEmailToVendorApi =
      "$serverLink/car/send_mail_to_seller";
  //Search
  static const String citesApi = "$serverLink/car/cities";
  static const String regionalSpecApi =
      "$serverLink/car/regional_specifications";
  static const String doorsNumberApi = "$serverLink/car/door_number";
  static const String seatsNumberApi = "$serverLink/car/seat_num";
  static const String insideColorApi = "$serverLink/car/inside_color";
  static const String outsideColorApi = "$serverLink/car/outside_color";
  static const String horsePowerApi = "$serverLink/car/horse_power";
  static const String fuelTypeApi = "$serverLink/car/fuel_type";
  static const String transmissionTypeApi = "$serverLink/car/transmission_type";
  static const String carConditionApi = "$serverLink/car/car_conditions";
  static const String brandsApi = "$serverLink/car/brands";
  static const String carsList = "$serverLink/car/cars_list";
  //Seller Data
  static const String sellerDataApi = "$serverLink/car/vendor_details";
  //auth
  static const String signUpApi = "$serverLink/register";
  static const String signInApi = "$serverLink/login";
  static const String sendOtpApi = "$serverLink/send_otp";
  static const String verifyOtpResetPasswordApi = "$serverLink/verified_otp";
  //Wishlist
  static const String wishlistApi = "$serverLink/wishlist";
  static const String addToWishlistApi = "$serverLink/wishlist/add/";
  static const String removeFromWishlistApi = "$serverLink/wishlist/remove/";
  //Account
  static const String getUserDataApi = "$serverLink/current_profile";
  static const String uploadUserImageApi = "$serverLink/upload_user_image";
  static const String uploadUserBackImageApi =
      "$serverLink/upload_background_image";
  static const String updateProfileApi = "$serverLink/update_profile";
  //Tickets
  static const String getSupportTickets = "$serverLink/support_tickets";
  static const String addSupportTicketApi = "$serverLink/add_support_ticket";
}
