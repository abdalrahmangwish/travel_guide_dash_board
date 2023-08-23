import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/comment_repository.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';


class AddCommentUseCase
    extends UseCase<AddCommentResponseModel, AddCommentParamsModel> {
  CommentRepository repository = CommentRepository();

  @override
  Future<Either<String, AddCommentResponseModel>> call(
      AddCommentParamsModel params) async {
    return await repository.addCommentModel(params);
  }
}

class GetAllCommentUseCase
    extends UseCase<List<CommentModel>?, GetCommentParamsModel> {
  CommentRepository repository = CommentRepository();

  @override
  Future<Either<String, List<CommentModel>?>> call(
      GetCommentParamsModel params) async {
    return await repository.getComment(params);
  }
}
