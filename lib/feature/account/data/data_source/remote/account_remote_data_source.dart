import 'package:dio/dio.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_service.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';

class AccountRemoteDataSource {
  NetworkServices networkServices = NetworkServices();

  Future<LoginResponseModel> login(
    LoginParamsModel model,
  ) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: model.toJson(),
        networkPath: NetworkConfigurations.kLoginPath,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(LoginResponseModel.fromJson(res));
  }

  Future<GetAllGuideResponseModel> getAllGuide() async {
    final res = await networkServices.get(
      RemoteDataBundle(
        body: {},
        networkPath: NetworkConfigurations.kGetAllGuide,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(GetAllGuideResponseModel.fromJson(res));
  }

  Future<AddGuideResponseModel> addGuide(
    AddGuideParamsModel model,
  ) async {
    Map<String, dynamic> mp = model.toJson();
    mp.addAll({
      "image": MultipartFile.fromBytes(
        model.image,
        filename: model.fileName,
      ),
    });
    FormData formData = FormData.fromMap(mp);
    final res = await networkServices.postFormData(
      RemoteDataBundle(
        data: formData,
        body: {},
        networkPath: NetworkConfigurations.kAddGuide,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(AddGuideResponseModel.fromJson(res));
  }

  Future<LogOutModel> logOut() async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: {},
        networkPath: NetworkConfigurations.kLogOut,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(LogOutModel.fromJson(res));
  }
}
