import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';

abstract class  IUserRepository {
  Future<Either<String, GetAllUserModel>> getAllUser();
}