import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constant {
  static LinearGradient primaryBodyColor = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFBDC3C7), Color(0xFF2c3e50)],
  );
  static Color secondaryColor = const Color(0xff2A2D3E);
  static Color bgColor = const Color(0xff212332);
  static double defaultPadding = 16.0;
  static const emailRegexStatement =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static RegExp emailRegex = RegExp(emailRegexStatement);

  static const linkRegexStatement =
      "(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})";
  static RegExp linkRegex = RegExp(linkRegexStatement);

  static List<String> type = [
    "restaurant",
    "hotel",
    "must see",
    "Places of entertainment"
  ];
}
