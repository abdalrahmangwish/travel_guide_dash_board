import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/city_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/repositories/activity_repositories.dart';

class GetAllCityUseCase extends UseCase<GetAllCityResponseModel, NoParams> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, GetAllCityResponseModel>> call(
    NoParams params,
  ) async {
    return repository.getAllCity();
  }
}

class AddCityUseCase extends UseCase<AddCityResponseModel, AddCityParamsModel> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, AddCityResponseModel>> call(
    AddCityParamsModel params,
  ) async {
    return repository.addCity(params);
  }
}
