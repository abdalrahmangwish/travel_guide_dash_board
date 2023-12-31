part of 'home_bloc.dart';

@immutable
abstract class GetAllAdsEvent {}

class GetNewAdsEvents extends GetAllAdsEvent {}

class UpdateAllPostPage extends GetAllAdsEvent {
  final List<ActivityRemoteModel> list;

  UpdateAllPostPage({required this.list});
}

class ReGetEvent extends GetAllAdsEvent {}
