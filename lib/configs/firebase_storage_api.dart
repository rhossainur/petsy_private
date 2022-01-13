import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorage{
  static UploadTask? uploadImage(String destination, File file){
    try {
      final imageReference=FirebaseStorage.instance.ref(destination);
      return imageReference.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

}