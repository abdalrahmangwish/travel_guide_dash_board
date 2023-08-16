part of 'add_guide_cubit.dart';

@immutable
abstract class AddGuideState {}

class AddGuideInitial extends AddGuideState {}

class UpdateImageLoading extends AddGuideState {}

class UpdateImageLoaded extends AddGuideState {}

class UpdateImageError extends AddGuideState {}

class AddGuideLoading extends AddGuideState {}

class AddGuideLoaded extends AddGuideState {}

class AddGuideError extends AddGuideState {}
