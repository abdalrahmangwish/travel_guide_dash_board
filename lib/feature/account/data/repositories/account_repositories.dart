import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/data_source/remote/account_remote_data_source.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/repositories/iaccount_repository.dart';

class AccountRepositories implements IAccountRepository {
  final AccountRemoteDataSource accountRemoteDataSource =
      AccountRemoteDataSource();

  @override
  Future<Either<String, LoginResponseModel>> login(
    LoginParamsModel model,
  ) async {
    try {
      final LoginResponseModel res = await accountRemoteDataSource.login(
        model,
      );
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }
  }

  @override
  Future<Either<String, LogOutModel>> logout() async {
    try {
      final LogOutModel res = await accountRemoteDataSource.logOut();
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }
  }
}
