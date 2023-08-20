import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/data_source/remote/account_remote_data_source.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/delete_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/repositories/iaccount_repository.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/delete_guide_use_case.dart';

import '../models/remote/add_guide_models.dart';

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
  Future<Either<String, AddGuideResponseModel>> addGuide(
    AddGuideParamsModel model,
  ) async {
    try {
      final AddGuideResponseModel res = await accountRemoteDataSource.addGuide(
        model,
      );
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }
  }

  @override
  Future<Either<String, GetAllGuideResponseModel>> getAllGuide() async {
    try {
      final GetAllGuideResponseModel res =
          await accountRemoteDataSource.getAllGuide();
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

  @override
  Future<Either<String, DeleteModel>> deleteGuide(DeleteParams params) async{
    try {
      final DeleteModel res = await accountRemoteDataSource.deleteGuide(params);
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }
  }
}
