import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/core/services/app_settings/app_settings.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/log_out_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/repositories/account_repositories.dart';

class LogOutUseCase extends UseCase<LogOutModel, NoParams> {
  AccountRepositories repository = AccountRepositories();

  @override
  Future<Either<String, LogOutModel>> call(NoParams params) async {
    final res = await repository.logout();
    res.fold(
      (l) => null,
      (r) {
        AppSettings().email = '';
        AppSettings().name = '';
        AppSettings().token = '';
      },
    );
    return res;
  }
}
