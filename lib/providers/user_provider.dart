import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  static Future<List<UserModel>> getUser() async {
    var res =
        await Dio().get('https://nct-api.vercel.app/user');
        print('res: ${res.data}');
    try {
      if (res.statusCode == 200) {
      print('res successfully: ${res.data}');
      final listUsers = ListUsers.fromJson(res.data);
      print('listUsers: $listUsers');
      return listUsers.users ?? [];

      // List<dynamic> jsonData = res.data['data'];
      // userList = jsonData.map((user) => UserModel.fromJson(user)).toList();
      // print('userList: ${userList.length}');
      // return userList;
    } else if (res.data is List<UserModel>) {
      print('arr_2:');
      return res.data;
    } else {
      print(res.statusCode);
      throw Exception('Failed to load data');
    }
    } catch (e) {
      throw Exception('Failed to call api: $e');
    }
  }
}
