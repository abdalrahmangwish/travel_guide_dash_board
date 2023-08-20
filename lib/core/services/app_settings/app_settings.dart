import 'dart:async';

import 'package:flutter/material.dart';

class AppSettings {
  static final AppSettings _instance = AppSettings._internal();

  StreamController<UpdateUiStream> updateUiStream =
      StreamController<UpdateUiStream>.broadcast();

  factory AppSettings() {
    return _instance;
  }

  AppSettings._internal();
  String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xOS41Mjo4MDAwL2FwaS9hZG1pbi9yZWdpc3RlciIsImlhdCI6MTY5MjU1MzI3MywiZXhwIjoxNjkyNTY3NjczLCJuYmYiOjE2OTI1NTMyNzMsImp0aSI6InhER1huTWlzRzROU1k3NlQiLCJzdWIiOiIxIiwicHJ2IjoiZGY4ODNkYjk3YmQwNWVmOGZmODUwODJkNjg2YzQ1ZTgzMmU1OTNhOSJ9.QHNkhnUatq4IYRUQ3Iv9CJljR147k4-ACzvoOLpR3bQ';
  String name = '';
  String email = '';
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class AppConstant {
  static const int kNormalAdsType = 0;
  static const int kServiceAdsType = 1;
  static const int kPostAdsType = 2;

  static const int pendingStatus = 0;
  static const int allAdsStatus = -1;
  static const int acceptedStatus = 1;
  static const descriptionRegexStatement = r'\$\$(.*?),(.*?),(.*?)\$\$';
  static RegExp descriptionRegex = RegExp(descriptionRegexStatement);
}

abstract class UpdateUiStream {}

class DeleteAdsEvent extends UpdateUiStream {
  final int adsId;

  DeleteAdsEvent(this.adsId);
}
