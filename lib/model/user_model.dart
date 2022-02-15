import 'package:flutter/material.dart';

class User {
  final String? uid;
  final String? email;
  final String? phone;
  final String? profileImageUrl;
  final String? name;
  final bool? emailVerified;
  final DateTime? creationTime;
  final DateTime? lastSignInTime;
  final List<String>? favourite;
  final List<String>? postList;
  final String? loginMethod;

  User(
      {@required this.phone,
      this.favourite,
      this.postList,
      this.loginMethod,
      @required this.emailVerified,
      @required this.creationTime,
      @required this.lastSignInTime,
      @required this.profileImageUrl,
      @required this.name,
      @required this.uid,
      @required this.email});

  factory User.fromMap(Map<String, dynamic> data) => User(
      uid: data['uid'],
      email: data['email'],
      phone: data['phone'],
      profileImageUrl: data['profileImageUrl'],
      creationTime: data['creationTime'].toDate(),
      emailVerified: data['emailVerified'],
      lastSignInTime: data['lastSignInTime'].toDate(),
      favourite: data['favourite'],
      postList: data['postList'],
      loginMethod: data['loginMethod'],
      name: data['name']);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'name': name,
      'creationTime': creationTime,
      'emailVerified': emailVerified,
      'lastSignInTime': lastSignInTime,
      'favourite': favourite,
      'postList': postList,
      'loginMethod': loginMethod
    };
  }
}
