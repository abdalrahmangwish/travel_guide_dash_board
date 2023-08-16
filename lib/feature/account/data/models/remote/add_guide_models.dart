import 'package:flutter/services.dart';

class AddGuideParamsModel {
  final String email;
  final String name;
  final String password;
  final String gender;
  final int age;
  final int yearsOfExperience;
  final String location;
  final String bio;
  final Uint8List image;
  final String fileName;

  AddGuideParamsModel({
    required this.fileName,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.age,
    required this.yearsOfExperience,
    required this.location,
    required this.bio,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['location'] = location;
    data['bio'] = bio;
    data['yearsofExperience'] = yearsOfExperience;
    data['age'] = age;
    data['gender'] = gender;
    data['password'] = password;

    return data;
  }
}

class AddGuideResponseModel {
  String? type;
  String? message;

  AddGuideResponseModel({this.type, this.message});

  AddGuideResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    return data;
  }
}

class GetAllGuideResponseModel {
  List<GuideModel>? data;

  GetAllGuideResponseModel({this.data});

  GetAllGuideResponseModel.fromJson(List<dynamic> json) {
    data = <GuideModel>[];
    for (var v in json) {
      data!.add(GuideModel.fromJson(v));
    }
  }
}

class GuideModel {
  int? id;
  String? name;
  String? image;
  String? age;
  int? yearsofExperience;
  String? location;
  String? bio;
  int? rating;

  GuideModel(
      {this.id,
      this.name,
      this.image,
      this.age,
      this.yearsofExperience,
      this.location,
      this.bio,
      this.rating});

  GuideModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    age = json['age'];
    yearsofExperience = json['yearsofExperience'];
    location = json['location'];
    bio = json['bio'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['age'] = this.age;
    data['yearsofExperience'] = this.yearsofExperience;
    data['location'] = this.location;
    data['bio'] = this.bio;
    data['rating'] = this.rating;
    return data;
  }
}
