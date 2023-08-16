part of 'home_bloc.dart';

@immutable
class GetAllAdsState {}

class ErrorGetAllAds extends GetAllAdsState {}

class CompleteGetAllAds extends GetAllAdsState {}

class LoadingForAnyThingButNotGetAllAds extends GetAllAdsState {}

class LoadingGetAllAds extends GetAllAdsState {}

class GettingNewPageLoading extends GetAllAdsState {}

class GetAllAdsInitial extends GetAllAdsState {}
