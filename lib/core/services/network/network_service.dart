import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/services/app_settings/app_settings.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/screen/login_page.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkServices implements IRemoteDataSource {
  static Map<String, String> headers =
      Map<String, String>.from(NetworkConfigurations.BaseHeaders);

  static Future<Map<String, String>> initTokenAndHeaders() async {
    headers.clear();
    headers.addAll({"Authorization": "Bearer ${AppSettings().token}"});
    headers.addAll({"accept": "application/json"});
    return headers;
  }

  _returnResponse(Response response) async {
    var responseJson =
        response.data.toString().isEmpty ? null : json.decode(response.data);
    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 401:
        if (AppSettings().navigatorKey.currentContext != null) {
          Utils.showCustomToast("please re login");
          Navigator.pushAndRemoveUntil(
            AppSettings().navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        }
        throw Exception('error while calling api');
      default:
        throw Exception('error while calling api');
    }
  }

  @override
  Future get(RemoteDataBundle remoteBundle) async {
    try {
      await initTokenAndHeaders();
      headers.addAll({"Content-Type": "application/json"});
      BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      );
      Dio dio = Dio(options);
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
      final Response response = await Dio().get(
        NetworkConfigurations.BaseUrl + remoteBundle.networkPath,
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
        ),
        queryParameters: remoteBundle.urlParams,
      );
      print(response.data);
      print("dsfsdfsdfsd");
      return _returnResponse(response);
    } on DioException catch (e) {
      if (e.response == null) throw Exception("no internet connection");
      _returnResponse(e.response!);
    }
  }

  @override
  Future post(RemoteDataBundle remoteBundle) async {
    try {
      await initTokenAndHeaders();
      headers.addAll({"Content-Type": "application/json"});
      BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      );
      Dio dio = Dio(options);
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ));

      final response = await dio.post(
        NetworkConfigurations.BaseUrl + remoteBundle.networkPath,
        data: remoteBundle.body,
        queryParameters: remoteBundle.urlParams,
        options: Options(
          headers: headers,
          responseType: ResponseType.plain,
        ),
      );
      return _returnResponse(response);
    } on DioException catch (e) {
      if (e.response == null) throw Exception("no internet connection");
      _returnResponse(e.response!);
    }
  }

  @override
  Future postFormData(RemoteDataBundle remoteBundle) async {
    try {
      await initTokenAndHeaders();

      headers.addAll({"Content-Type": "multipart/form-data"});
      var dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
      final response = await dio.post(
        NetworkConfigurations.BaseUrl + remoteBundle.networkPath,
        data: remoteBundle.data,
        options: Options(headers: headers, responseType: ResponseType.plain),
      );
      headers.addAll({"Content-Type": "application/json"});

      return _returnResponse(response);
    } on DioException catch (e) {
      if (e.response == null) throw Exception("no internet connection");
      _returnResponse(e.response!);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
