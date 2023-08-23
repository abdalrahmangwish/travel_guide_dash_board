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
  String? image;
  String? email;
  UserType? type;

  AdminModel({this.id, this.name, this.image, this.type});

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    type = UserType.fromString(json['type'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['type'] = type;
    return data;
  }
}

enum UserType {
  user,
  guide;

  static formInt(int val) {
    if (val == 0)
      return UserType.user;
    else
      return UserType.guide;
  }

  static fromString(String val) {
    if (val == "user")
      return UserType.user;
    else
      return UserType.guide;
  }

  String toString() {
    switch (this) {
      case guide:
        return "guide";
      case user:
        return "user";
    }
  }

  toInt() {
    switch (this) {
      case user:
        return 0;
      case guide:
        return 1;
    }
  }
}
