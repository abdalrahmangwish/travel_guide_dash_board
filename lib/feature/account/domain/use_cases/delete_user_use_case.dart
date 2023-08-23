import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/delete_user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/repositories/account_repositories.dart';

class DeleteUserUseCase
    extends UseCase<DeleteUserResponseModel, DeleteUserParamsModel> {
  AccountRepositories repository = AccountRepositories();

  @override
  Future<Either<String, DeleteUserResponseModel>> call(
      DeleteUserParamsModel params) async {
    final res = await repository.deleteUser(params);
    return res;
  }
}
