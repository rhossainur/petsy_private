import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStorage{
  Future<String> uploadImage(String destination, File file) async{
    try {
      final imageReference=FirebaseStorage.instance.ref(destination);
      await imageReference.putFile(file);
      String downloadUrl= await imageReference.getDownloadURL();
      print("successful url: "+ downloadUrl);
      return downloadUrl;
    } on FirebaseException catch (e) {
      // ignored, really.
      return "exception";
    }
  }
}