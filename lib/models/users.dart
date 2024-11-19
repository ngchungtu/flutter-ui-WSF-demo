import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';

class UserModel {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
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
    return UserModel(id: id, email: email, firstName: firstName, lastName: lastName);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
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
