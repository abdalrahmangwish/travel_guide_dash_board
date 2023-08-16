import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/domain/use_cases/get_all_activity_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class GetAllAdsBloc extends Bloc<GetAllAdsEvent, GetAllAdsState> {
  List<ActivityRemoteModel> listOfAllActivity = [];
  int page = 1;
  bool lastPage = false;
  GetAllAdsBloc() : super(GetAllAdsInitial()) {
    on<GetNewAdsEvents>((event, emit) async {
      if (page != 1) {
        emit(GettingNewPageLoading());
      } else {
        emit(LoadingGetAllAds());
      }
      final result =
          await GetAllActivityUseCase().call(GetActivityParamsModel(page));
      result.fold(
        (l) => emit(ErrorGetAllAds()),
        (r) {
          List<ActivityRemoteModel?> tempList = [];
          tempList.addAll(r.data?.data ?? []);
          for (int i = 0; i < tempList.length; i++) {
            var element = tempList[i];
            int index = listOfAllActivity
                .indexWhere((element2) => element?.id == element2.id);
            if (index != -1) {
              r.data?.data?.removeAt(i);
            }
          }
          listOfAllActivity.addAll(r.data?.data ?? []);
          if (r.data?.data?.length != 10) lastPage = true;
          page++;
          emit(CompleteGetAllAds());
        },
      );
    });
    on<UpdateAllPostPage>((event, emit) async {
      emit(LoadingForAnyThingButNotGetAllAds());
      lastPage = false;
      page = 2;
      listOfAllActivity = event.list;
      if (event.list.length != 10) lastPage = true;
      emit(CompleteGetAllAds());
    });
    on<ReGetEvent>((event, emit) async {
      emit(LoadingGetAllAds());
      lastPage = false;
      page = 1;
      final result = await GetAllActivityUseCase().call(
        GetActivityParamsModel(page),
      );
      result.fold(
        (l) => emit(ErrorGetAllAds()),
        (r) {
          List<ActivityRemoteModel?> tempList = [];
          tempList.addAll(r.data?.data ?? []);
          for (int i = 0; i < tempList.length; i++) {
            var element = tempList[i];
            int index = listOfAllActivity
                .indexWhere((element2) => element?.id == element2.id);
            if (index != -1) {
              r.data?.data?.removeAt(i);
            }
          }
          listOfAllActivity.addAll(r.data?.data ?? []);
          if (r.data?.data?.length != 10) lastPage = true;
          page++;
          emit(CompleteGetAllAds());
        },
      );
    });
  }
}
