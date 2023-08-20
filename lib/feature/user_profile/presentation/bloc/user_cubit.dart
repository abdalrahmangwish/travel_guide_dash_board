import 'package:bloc/bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/domain/use_case/get_all_user_use_case.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
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
}
