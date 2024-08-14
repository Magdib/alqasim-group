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

  //
  static const String carDetailsApi = "$serverLink/car/details/";
  //auth
}
