import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/domain/use_cases/add_guide_use_case.dart';

part 'guides_state.dart';

class GuidesCubit extends Cubit<GuidesState> {
  GuidesCubit() : super(GuidesInitial());
  List<GuideModel> guides = [];
  void getGuides() async {
    emit(GetGuideLoading());
    final res = await GetGuideUseCase().call(NoParams());
    res.fold((l) => emit(GetGuideError()), (r) {
      guides = r.data ?? [];
      emit(GetGuideLoaded());
    });
  }
}
