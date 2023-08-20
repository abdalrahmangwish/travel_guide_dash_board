import 'package:dio/dio.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_service.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/delete_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/delete_guide_use_case.dart';

class AccountRemoteDataSource {
  NetworkServices networkServices = NetworkServices();
  final Dio _dio = Dio();

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

  Future<DeleteModel> deleteGuide(DeleteParams params) async {
    final token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2FkbWluL3JlZ2lzdGVyIiwiaWF0IjoxNjkyMzg4MzA5LCJleHAiOjE2OTI0MDI3MDksIm5iZiI6MTY5MjM4ODMwOSwianRpIjoiS3R3emF6bHFUOFFZWlNjMCIsInN1YiI6IjQiLCJwcnYiOiJkZjg4M2RiOTdiZDA1ZWY4ZmY4NTA4MmQ2ODZjNDVlODMyZTU5M2E5In0.urJ4YFba8sKg3J2Do27AT00t-EKXCrAdAw6jqB-mZcQ';
    final options = Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final url = 'http://localhost:8000/api/for_admin/delete_any_guide/${params.id}';
    try {
      final response = await _dio.delete(url);

      if (response.statusCode == 200) {
        return DeleteModel();
      } else {
        throw Exception('Failed to delete guide');
      }
    } catch (error) {
      throw Exception('Failed to delete guide: $error');
    }
  }

}
