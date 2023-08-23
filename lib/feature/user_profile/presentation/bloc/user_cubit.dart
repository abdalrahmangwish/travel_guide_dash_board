import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/delete_user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/delete_user_use_case.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/domain/use_case/get_all_user_use_case.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserInitial());
  List<UserModel> users = [];
  void getUser() async {
    emit(GetUserLoading());
    final res = await GetAllUserUseCase().call(NoParams());
    res.fold((l) => emit(GetUserError()), (r) {
      users = r.data ?? [];
      emit(GetUserLoaded());
    });
  }

  void deleteUser(int id) async {
    emit(DeleteUserLoading());
    final res = await DeleteUserUseCase().call(DeleteUserParamsModel(id: id));
    res.fold((l) => emit(DeleteUserError()), (r) {
      users.removeWhere((element) => element.id == id);
      emit(DeleteUserLoaded());
    });
  }
}
