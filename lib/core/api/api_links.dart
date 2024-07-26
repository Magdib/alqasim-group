class ApiLinks {
  static Map<String, String> header = {
    "Accept": "application/json",
  };
  static Map<String, String> authorizedHeaders = {
    'Content-Type': 'application/json',
    // 'Authorization': "Bearer ${AppServices.token}",
  };

  static const serverLink = 'https://msplus.net/quranapp/public/api';
  static const secondServerLink =
      'https://msplushosting.com/quran_api/public/api';

  static const assetsStorageLink =
      'https://msplus.net/quranapp/storage/app/public';
  //end point
  static const getSheikhApi = '$serverLink/get_sheikhs';
  static const getSheikhSuraApi = '$serverLink/get_sheikh_surahs';
  static const searchApi = '$serverLink/search_sheikh_surahs';
  //auth
  static const loginApi = '$secondServerLink/login';
  static const registerApi = '$secondServerLink/register';
  static const registerGoogleApi = '$serverLink/register_client';
  static const loginGoogleApi = '$serverLink/login_client';
  //settings
  static const getSettings = '$serverLink/get_our_apps';
  //Points
  static const googleGetPoints = "$serverLink/get_profile_client";
  static const accountGetPoints = "$secondServerLink/get_user_profile";
  static const accountAddPoints = "$secondServerLink/add_points";
  static const googleAddPoints = "$serverLink/add_points";
}
