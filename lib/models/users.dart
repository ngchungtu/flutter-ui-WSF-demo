import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ListUsers {
  final List<UserModel>? users;

  const ListUsers({this.users});

  factory ListUsers.fromJson(List<dynamic> json) {
    return ListUsers(
        users: json.map((json) => UserModel.fromJson(json)).toList());
  }
}

class UserModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // return UserModel(
    //   id: int.parse(json['id'] as String),
    //   email: json["email"] as String,
    //   firstName: json["first_name"] as String,
    //   lastName: json["last_name"] as String,
    // );
    final id = json['id'];
    final email = json['email'];
    final firstName = json['first_name'];
    final lastName = json['last_name'];
    final avatar = json['avatar'];
    return UserModel(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };
}

class UserAddress {
  final String? street;
  final String? suite;

  const UserAddress({
    this.street,
    this.suite,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    final street = json['street'];
    final suite = json['suite'];

    return UserAddress(
      street: street,
      suite: suite,
    );
  }

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
      };
}

// #region model class Profilever2
class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}
// #endregion
