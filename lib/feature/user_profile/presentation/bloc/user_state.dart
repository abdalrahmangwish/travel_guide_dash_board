part of 'user_cubit.dart';

@immutable
abstract class UserCubitState {}

class UserInitial extends UserCubitState {}

class GetUserLoading extends UserCubitState {}

class GetUserError extends UserCubitState {}

class GetUserLoaded extends UserCubitState {}

class DeleteUserLoading extends UserCubitState {}

class DeleteUserLoaded extends UserCubitState {}

class DeleteUserError extends UserCubitState {}
