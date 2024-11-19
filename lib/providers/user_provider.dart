import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  static Future<List<UserModel>> getUser() async {
    // List<UserModel> userList = [];
    var res =
        await Dio().get('https://jsonplaceholder.typicode.com/users?id=1');
    print('getUser void');
    if (res.statusCode == 200) {
      print('res successfully: ${res.data}');
      List<dynamic> jsonData = res.data;
      var userList = jsonData.map((user) => UserModel.fromJson(user)).toList();
      print('userList: $userList');
      return userList;
    } else if (res.data is List<UserModel>) {
      print('arr_2:');
      return res.data;
    } else {
      print(res.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
