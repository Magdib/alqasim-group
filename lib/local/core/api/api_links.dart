class ApiLinks {
  static Map<String, String> header = {
    "Accept": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    // 'Authorization': "Bearer ${AppServices.token}",
  };

  static const serverLink =
      'https://www.flexilitecompany.com/al_qassim_project/public/api';
  //end point

  //Home
  static const sliderApi = "$serverLink/car/sliders";
  static const categoriesApi = '$serverLink/car/categories';
  static const brandsApi = "$serverLink/car/brands";
  //auth

  //settings

  //Points
}
