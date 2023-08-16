import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/repositories/account_repositories.dart';

class AddGuideUseCase
    extends UseCase<AddGuideResponseModel, AddGuideParamsModel> {
  AccountRepositories repository = AccountRepositories();

  @override
  Future<Either<String, AddGuideResponseModel>> call(
    AddGuideParamsModel params,
  ) async {
    return repository.addGuide(params);
  }
}

class GetGuideUseCase extends UseCase<GetAllGuideResponseModel, NoParams> {
  AccountRepositories repository = AccountRepositories();

  @override
  Future<Either<String, GetAllGuideResponseModel>> call(
    NoParams params,
  ) async {
    return repository.getAllGuide();
  }
}
