import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/repository/user_repository.dart';

class GetAllUserUseCase extends UseCase<GetAllUserModel, NoParams> {
  UserRepository repository = UserRepository();

  @override
  Future<Either<String, GetAllUserModel>> call(
      NoParams params,
      ) async {
    return repository.getAllUser();
  }
}
