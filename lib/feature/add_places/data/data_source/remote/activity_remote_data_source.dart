import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_service.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/city_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';

class ActivityRemoteDataSource {
  NetworkServices networkServices = NetworkServices();

  Future<GetAllCityResponseModel> getAllCities() async {
    final res = await networkServices.get(
      RemoteDataBundle(
        body: {},
        networkPath: NetworkConfigurations.kGetAllCity,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(GetAllCityResponseModel.fromJson(res));
  }


  Future<GetActivityResponseModel> getActivity(
      GetActivityParamsModel params) async {
    final res = await networkServices.get(
      RemoteDataBundle(
        body: {},
        networkPath: NetworkConfigurations.kGetActivity,
        urlParams: <String, dynamic>{"page": params.page},
      ),
    );
    return Future.value(GetActivityResponseModel.fromJson(res));
  }

  Future<AddActivityResponseModel> addActivity(
      AddActivityParamsModel params) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: params.toJson(),
        networkPath: NetworkConfigurations.kAddActivity,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(AddActivityResponseModel.fromJson(res));
  }

  Future<AddCityResponseModel> addCity(AddCityParamsModel params) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: params.toJson(),
        networkPath: NetworkConfigurations.kAddCity,
        urlParams: <String, String>{},
      ),
    );

    return Future.value(AddCityResponseModel.fromJson(res));
  }

  Future<AddRegionResponseModel> addRegion(AddRegionParamsModel params) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: params.toJson(),
        networkPath: NetworkConfigurations.kAddRegion,
        urlParams: <String, String>{},
      ),
    );

    return Future.value(AddRegionResponseModel.fromJson(res));
  }

  Future<GetAllRegionResponseModel> getRegion(
      GetRegionParamsModel params) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: params.toJson(),
        networkPath: NetworkConfigurations.kGetRegion,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(GetAllRegionResponseModel.fromJson(res));
  }
}
