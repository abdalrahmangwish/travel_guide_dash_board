import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/repositories/activity_repositories.dart';

class GetAllActivityUseCase
    extends UseCase<GetActivityResponseModel, GetActivityParamsModel> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, GetActivityResponseModel>> call(
    GetActivityParamsModel params,
  ) async {
    return repository.getAllActivity(params);
  }
}
