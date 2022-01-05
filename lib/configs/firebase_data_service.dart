import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:petpal/model/post_model.dart';

class FirebaseDataService extends ChangeNotifier{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference posts=FirebaseFirestore.instance.collection('posts');
  final createPostRef = FirebaseFirestore.instance
      .collection('posts')
      .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
          toFirestore: (post, _) => post.toMap());

  Future addUser() async {}

  Future updateUser() async {}

  Future addPost(Post post) async {
    return posts.add(post.toMap());
  }
}
