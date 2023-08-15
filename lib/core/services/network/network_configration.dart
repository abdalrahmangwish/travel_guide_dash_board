class NetworkConfigurations {
  static const kLoginPath = 'admin/login';
  static const kLogOut = 'logout_admin';
  static const kUploadImage = 'for_admin/addimages';
  static const kGetAllCity = 'for_admin/getcities';
  static const kAddActivity = 'for_admin/addactivity';
  static const kGetRegion = 'for_admin/getregionsincity';
  static const kAddCity = 'for_admin/addcity';
  static const kAddRegion = 'for_admin/addregion';
  static const kGetImagePath = 'storage/public/images';

  static const String BaseUrl = "http://192.168.1.15:8000/api/";
  static const Map<String, String> BaseHeaders = {
    "accept": "application/json, */* ,charset=UTF-8",
    'Charset': 'utf-8'
  };
}
