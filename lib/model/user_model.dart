import 'package:flutter/material.dart';

class User {
  final String? uid;
  final String? email;
  final String? phone;
  final String? profileImageUrl;
  final String? name;

  User(
      {@required this.phone,
      @required this.profileImageUrl,
      @required this.name,
      @required this.uid,
      @required this.email});

  factory User.fromMap(Map<String, dynamic> data) => User(
      uid: data['uid'],
      email: data['email'],
      phone: data['phone'],
      profileImageUrl: data['profileImageUrl'],
      name: data['name']);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'name': name
    };
  }
}
