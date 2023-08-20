part of 'guides_cubit.dart';

@immutable
abstract class GuidesState {}

class GuidesInitial extends GuidesState {}

class GetGuideLoading extends GuidesState {}

class GetGuideError extends GuidesState {}

class GetGuideLoaded extends GuidesState {}

class DeleteGuideLoading extends GuidesState {}

class DeleteGuideError extends GuidesState {}

class DeleteGuideLoaded extends GuidesState {}

