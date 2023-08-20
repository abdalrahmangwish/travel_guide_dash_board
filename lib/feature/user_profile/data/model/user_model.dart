
class GetAllUserModel {
  List<UserModel>? data;

  GetAllUserModel({this.data});

  GetAllUserModel.fromJson(List<dynamic> json) {
    data = <UserModel>[];
    for (var v in json) {
      data!.add(UserModel.fromJson(v));
    }
  }
}

class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;


  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}