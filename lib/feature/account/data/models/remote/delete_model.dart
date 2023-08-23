class DeleteModel {
  String? message;

  DeleteModel({this.message});
  DeleteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
