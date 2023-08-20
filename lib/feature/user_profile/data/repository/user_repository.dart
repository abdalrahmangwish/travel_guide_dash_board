import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/remote_data_source/user_remote_data_source.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/domain/repository/iuser_reposittory.dart';

class UserRepository extends IUserRepository{
  final UserRemoteDataSource userRemoteDataSource =UserRemoteDataSource();
  @override
  Future<Either<String, GetAllUserModel>> getAllUser() async{
    try {
      final GetAllUserModel res =
          await userRemoteDataSource.getAllUser();
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }  }

}