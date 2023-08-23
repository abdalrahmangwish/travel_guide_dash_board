part of 'guides_cubit.dart';

@immutable
abstract class GuidesState {}

class GuidesInitial extends GuidesState {}

class GetGuideLoading extends GuidesState {}

class GetGuideError extends GuidesState {}

class GetGuideLoaded extends GuidesState {}

class DeleteGuideLoading extends GuidesState {
  final int id;

  DeleteGuideLoading(this.id);
}

class DeleteGuideError extends GuidesState {
  final int id;

  DeleteGuideError(this.id);
}

class DeleteGuideLoaded extends GuidesState {
  final int id;

  DeleteGuideLoaded(this.id);
}
