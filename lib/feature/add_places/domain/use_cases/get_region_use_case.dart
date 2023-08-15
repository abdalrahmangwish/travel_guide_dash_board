import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/city_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/repositories/activity_repositories.dart';

class GetRegionUseCase
    extends UseCase<GetAllRegionResponseModel, GetRegionParamsModel> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, GetAllRegionResponseModel>> call(
    GetRegionParamsModel params,
  ) async {
    return repository.getRegion(params);
  }
}

class AddRegionUseCase
    extends UseCase<AddRegionResponseModel, AddRegionParamsModel> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, AddRegionResponseModel>> call(
    AddRegionParamsModel params,
  ) async {
    return repository.addRegion(params);
  }
}
