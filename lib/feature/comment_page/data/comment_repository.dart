import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/remote_data_source/comment_remote_data_source.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/domain/repository/icomment_repository.dart';

class CommentRepository implements ICommentRepository{
  final CommentRemoteDataSource commentRemoteDataSource =CommentRemoteDataSource();
  @override
  Future<Either<String, AddCommentResponseModel>> addCommentModel(
      AddCommentParamsModel params) async {
    try {
      final AddCommentResponseModel res =
      await commentRemoteDataSource.addComment(params);
      return Right(res);
    } catch (e) {
      return const Left("Error while updating fcm token");
    }
  }

  @override
  Future<Either<String, List<CommentModel>?>> getComment(
      GetCommentParamsModel model) async {
    final List<CommentModel>? res =
    await commentRemoteDataSource.getAllComment(model);
    return Right(res);
  }
}