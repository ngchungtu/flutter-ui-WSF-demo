import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  static Future<List<Map<String, dynamic>>> getUser() async {
    List<UserModel> userList = [];
    var res = await Dio().get('https://reqres.in/api/users/2');
    if (res.statusCode == 200) {
      var arr = res.data as List<Map<String, dynamic>>;
      if (arr is List<UserModel>) {
        print('arr_2: $arr');
      }
      // print('user_Log: $user');
      // print('status: ${res.statusCode}');
      print('res: $arr');
      return arr;
    } else {
      print(res.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
