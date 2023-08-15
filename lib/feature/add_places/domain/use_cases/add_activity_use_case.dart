import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/repositories/activity_repositories.dart';

class AddActivityUseCase
    extends UseCase<AddActivityResponseModel, AddActivityParamsModel> {
  ActivityRepositories repository = ActivityRepositories();

  @override
  Future<Either<String, AddActivityResponseModel>> call(
    AddActivityParamsModel params,
  ) async {
    return repository.addActivity(params);
  }
}
