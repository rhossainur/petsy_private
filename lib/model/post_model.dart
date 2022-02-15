import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String? postType;
  final String? animal;
  final String? name;
  final String? color;
  final String? breed;
  final int? years;
  final int? months;
  final String? description;
  final String? userId;
  final Timestamp? createDateAndTime;
  final List? photoList;

  Post(
      {@required this.name,
      @required this.createDateAndTime,
      @required this.postType,
      @required this.animal,
      @required this.color,
      @required this.breed,
      @required this.years,
      @required this.months,
      @required this.description,
      @required this.photoList,
      @required this.userId});

  factory Post.fromMap(Map<String, dynamic> data) => Post(
      userId: data['userId'],
      createDateAndTime: data['createdDateAndTime'],
      animal: data['animal'],
      color: data['color'],
      years: data['years'],
      months: data['months'],
      breed: data['breed'],
      description: data['description'],
      postType: data['type'],
      photoList: data['photoList'],
      name: data['name']);

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'animal': animal,
      'color': color,
      'years': years,
      'months': months,
      'breed': breed,
      'description': description,
      'name': name,
      'type': postType,
      'createdDateAndTime': createDateAndTime,
      'photoList':photoList
    };
  }
}
