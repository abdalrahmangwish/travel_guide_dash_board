import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/domain/comment_use_case/comment_use_case.dart';


part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());
  List<CommentModel> commentList = [];
  bool lastPage = false;
  void getCommentForCurrentPost(int activityId) async {
    emit(LoadingGetAllComment());

    final result = await GetAllCommentUseCase().call(
      GetCommentParamsModel(activityId: activityId),
    );
    result.fold(
      (l) => emit(ErrorGetAllComment()),
      (r) {
        commentList.addAll(r ?? []);
        emit(CompleteGetAllComment());
      },
    );
  }

  void addComment(AddCommentParamsModel comment) async {
    emit(AddCommentLoading());

    final res = await AddCommentUseCase().call(comment);
    res.fold((l) => emit(AddCommentError(l)), (r) {
      if (r.data != null) {
        commentList.add(r.data!);
      }
      emit(CompleteGetAllComment());
    });
  }
}
