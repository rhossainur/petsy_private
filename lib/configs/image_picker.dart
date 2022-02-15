import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petpal/configs/firebase_storage_api.dart';

class ImagePickingService with ChangeNotifier {
  File? imagePicked;
  String? downloadUrl;
  Future pickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (image == null) return;
    final imageTemporary = File(image.path);
    imagePicked = imageTemporary;
    notifyListeners();
  }

  Future uploadImage(File? file,String docCreationTime, String uid,int imageNumber) async{
    final destination='$uid/$docCreationTime/imageNumber_$imageNumber/image_$imageNumber.jpg';
    FireStorage fireStorage=FireStorage();
    downloadUrl=await fireStorage.uploadImage(destination, file!);
    notifyListeners();
  }
}
