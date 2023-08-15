import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';

abstract class IAccountRepository {
  Future<Either<String, LoginResponseModel>> login(
    LoginParamsModel model,
  );

  Future<Either<String, LogOutModel>> logout();
}
