import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_interface.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_service.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';

class CommentRemoteDataSource {
  NetworkServices networkServices = NetworkServices();
  Future<AddCommentResponseModel> addComment(
      AddCommentParamsModel params) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: params.toJson(),
        networkPath: NetworkConfigurations.BaseUrl,
        urlParams: <String, String>{},
      ),
    );
    return Future.value(AddCommentResponseModel.fromJson(res));
  }

  Future<List<CommentModel>?> getAllComment(GetCommentParamsModel model) async {
    final res = await networkServices.post(
      RemoteDataBundle(
        body: model.toJson(),
        networkPath: NetworkConfigurations.kGetComment,
        urlParams: {},
      ),
    );
    final res2 = GetCommentResponseModel.fromJson(res);
    return Future.value(res2.listOfAllComment);
  }
}
