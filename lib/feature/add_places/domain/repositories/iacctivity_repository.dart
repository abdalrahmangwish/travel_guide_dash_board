import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/city_models.dart';

abstract class IActivityRepository {
  Future<Either<String, GetAllCityResponseModel>> getAllCity();
  Future<Either<String, AddRegionResponseModel>> addRegion(
      AddRegionParamsModel params);
  Future<Either<String, AddCityResponseModel>> addCity(
      AddCityParamsModel params);
  Future<Either<String, GetAllRegionResponseModel>> getRegion(
      GetRegionParamsModel params);
  Future<Either<String, AddActivityResponseModel>> addActivity(
      AddActivityParamsModel paramsModel);
}
