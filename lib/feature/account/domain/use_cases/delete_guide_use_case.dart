import 'package:dartz/dartz.dart';
import 'package:flutter_travel_guide_dashborad/core/models/user_case_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/delete_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/repositories/account_repositories.dart';

class DeleteGuideUseCase extends UseCase<DeleteModel, DeleteParams> {
  AccountRepositories repository = AccountRepositories();

  @override
  Future<Either<String, DeleteModel>> call(DeleteParams params) async {
    final res = await repository.deleteGuide(params);
    return res;
  }
}
class DeleteParams {
  DeleteParams({
    required this.id
});
  final int id ;
}