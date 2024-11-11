import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> userList = [];
  final dio = Dio();

  static getUser() async {
    try {
      // var res = await dio.get('https://reqres.in/api/users/2');
      var res = await Dio().get('https://reqres.in/api/users/2');
      if(res.statusCode == 200) {
       print('userLisst: $res');
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print('Error getting');
    }
  }
}
