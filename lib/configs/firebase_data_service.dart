import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:petpal/model/post_model.dart';
import 'package:petpal/model/user_model.dart' as user_model;

class FirebaseDataService extends ChangeNotifier {
  CollectionReference createPostRef = FirebaseFirestore.instance
      .collection('posts')
      .withConverter<Post>(
          fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
          toFirestore: (post, _) => post.toMap());
  CollectionReference createUserRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<user_model.User>(
          fromFirestore: (snapshot, _) =>
              user_model.User.fromMap(snapshot.data()!),
          toFirestore: (user, _) => user.toMap());

  Future addUser(user_model.User user) async {
    return createUserRef.doc(user.uid).set(user);
  }

  Future updateUser() async {}

  Future<DocumentReference> addPost(Post post) async {
    return createPostRef.add(post);
  }

  Stream<QuerySnapshot> postStream() {
    return createPostRef
        .orderBy('createdDateAndTime', descending: true)
        .snapshots();
  }
  Future<DocumentSnapshot> getUser(String uid) async{
    return createUserRef.doc(uid).get();
  }
}
