import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref/model/usermodel.dart';

class Prefs {
  static storeName(String name) async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    preds.setString("name", name);
  }

  static Future loadName() async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    return preds.getString("name");
  }

  static Future removeName() async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    return preds.remove("name");
  }

  static storeUser(User user) async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user.toJson());
    preds.setString("user", stringUser);
  }

  /// store => object(tojson) => json(map)(jsobencode) => string => save
  /// read => string => json(map)(jsondecode) => user(object)(fromjson) => read
  static Future loaduser() async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    String? stringUser = preds.getString("user");
    if (stringUser == null || stringUser.isEmpty) {
      return null;
    }
    Map<String,dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future removUser() async {
    SharedPreferences preds = await SharedPreferences.getInstance();
    return preds.remove("user");
  }
}
