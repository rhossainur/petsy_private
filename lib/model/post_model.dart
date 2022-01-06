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

  Post(
      {@required this.name,
      @required this.postType,
      @required this.animal,
      @required this.color,
      @required this.breed,
      @required this.years,
      @required this.months,
      @required this.description,
      @required this.userId});

  factory Post.fromMap(Map<String, dynamic> data) => Post(
      userId: data['userId'],
      animal: data['animal'],
      color: data['color'],
      years: data['years'],
      months: data['months'],
      breed: data['breed'],
      description: data['description'],
      postType: data['type'],
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
      'type': postType
    };
  }
}
