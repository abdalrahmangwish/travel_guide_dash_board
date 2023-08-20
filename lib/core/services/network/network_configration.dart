class NetworkConfigurations {
  static const kLoginPath = 'admin/login';
  static const kAddGuide = 'for_admin/addguide';
  static const kGetAllGuide = 'for_admin/get_all_guides';
  static const kGetAllUsers = 'for_admin/get_all_users';
  static const kLogOut = 'admin/logout';
  static const kUploadImage = 'for_admin/addimages';
  static const kGetAllCity = 'for_admin/getcities';
  static const kGetActivity = 'for_admin/getactivity';
  static const kAddActivity = 'for_admin/addactivity';
  static const kGetRegion = 'for_admin/getregionsincity';
  static const kAddCity = 'for_admin/addcity';
  static const kAddRegion = 'for_admin/addregion';

  static const String BaseUrl = "http://192.168.19.52:8000/api/";
  static const Map<String, String> BaseHeaders = {
    "accept": "application/json, */* ,charset=UTF-8",
    'Charset': 'utf-8'
  };
}
