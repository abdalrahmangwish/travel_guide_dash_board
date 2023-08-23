class DeleteUserResponseModel {
  String? message;

  DeleteUserResponseModel({this.message});
  DeleteUserResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

class DeleteUserParamsModel {
  int? id;

  DeleteUserParamsModel({this.id});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
