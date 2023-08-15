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

  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2FkbWluL2xvZ2luIiwiaWF0IjoxNjkyMTM1NjA5LCJleHAiOjE2OTIxNTAwMDksIm5iZiI6MTY5MjEzNTYwOSwianRpIjoiZkVyN3NsWnFOSk5jRFdjQyIsInN1YiI6IjEiLCJwcnYiOiJkZjg4M2RiOTdiZDA1ZWY4ZmY4NTA4MmQ2ODZjNDVlODMyZTU5M2E5In0.4cERKTeZc9jZxIvxhAD6nvd-LDU-oFHQQOPEHkYHtUI';
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
