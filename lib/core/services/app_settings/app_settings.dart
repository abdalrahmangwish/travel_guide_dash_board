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
  String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xOTguNTI6ODAwMC9hcGkvYWRtaW4vcmVnaXN0ZXIiLCJpYXQiOjE2OTI3NDc3NTEsImV4cCI6MTY5Mjc2MjE1MSwibmJmIjoxNjkyNzQ3NzUxLCJqdGkiOiJhZlpMREU5RnB6MElIbmFLIiwic3ViIjoiMiIsInBydiI6ImRmODgzZGI5N2JkMDVlZjhmZjg1MDgyZDY4NmM0NWU4MzJlNTkzYTkifQ.L6y5AAiIQV9Eo4VCVZAcMszSitFn5S92znC6RVH7ah0';
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
