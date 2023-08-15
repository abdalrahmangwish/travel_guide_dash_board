class LoginParamsModel {
  final String email;
  final String password;

  LoginParamsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}

class LoginResponseModel {
  String? accessToken;
  AdminModel? admin;

  LoginResponseModel({this.accessToken, this.admin});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    admin = json['admin'] != null ? AdminModel.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    return data;
  }
}

class AdminModel {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  AdminModel({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
