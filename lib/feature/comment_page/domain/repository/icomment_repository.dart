import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';

abstract class ICommentRepository {
  Future<Either<String, List<CommentModel>?>> getComment(
      GetCommentParamsModel model);
  Future<Either<String, AddCommentResponseModel>> addCommentModel(
      AddCommentParamsModel params);
}