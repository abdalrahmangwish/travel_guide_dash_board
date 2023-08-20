part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class GetUserLoading extends UserState {}

class GetUserError extends UserState {}

class GetUserLoaded extends UserState {}