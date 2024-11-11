import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/users.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> userLisst = [];
  final dio = Dio();

  void getUser() async {
    try {
      var res = await dio.get('https://reqres.in/api/users/2');
      if(res.statusCode == 200) {
       userLisst = res.data['data'] as List<UserModel>; 
       print('userLisst: $res');
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print('Error getting');
    }
  }
}
