import 'package:dio/dio.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_service.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';

class UserRemoteDataSource {
  NetworkServices networkServices = NetworkServices();

  Future<GetAllUserModel> getAllUser() async {
    final res = await networkServices.get(
      RemoteDataBundle(
        body: {},
        networkPath: NetworkConfigurations.kGetAllUsers,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(GetAllUserModel.fromJson(res));
  }
}