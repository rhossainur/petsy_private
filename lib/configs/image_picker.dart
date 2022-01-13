import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:petpal/configs/firebase_storage_api.dart';

class ImagePickingService with ChangeNotifier {
  File? imagePicked;
  UploadTask? uploadTask;

  Future pickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (image == null) return;
    final imageTemporary = File(image.path);
    imagePicked = imageTemporary;
    notifyListeners();
  }

  Future uploadImage(File? file, String uid,int imageNumber) async{
    final fileName=basename(file!.path);
    final destination='$uid/imageNumber_$imageNumber/$fileName';
    uploadTask=FireStorage.uploadImage(destination, file);
    notifyListeners();
  }
}
