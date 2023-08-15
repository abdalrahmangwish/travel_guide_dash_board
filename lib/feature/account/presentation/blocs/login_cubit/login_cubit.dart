import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/services/app_settings/app_settings.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/login_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(LoginParamsModel paramsModel) async {
    emit(LoginLoading());
    final res = await LoginUseCase().call(paramsModel);
    res.fold(
      (l) => emit(LoginError()),
      (r) async {
        AppSettings().token = r.accessToken ?? "";
        AppSettings().email = r.admin?.email ?? "";
        AppSettings().name = r.admin?.name ?? "";
        emit(LoginLoaded());
      },
    );
  }
}
