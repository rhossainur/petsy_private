import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickingService with ChangeNotifier{
  File? imagePicked;
  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image==null) return;
    final imageTemporary=File(image.path);
    imagePicked=imageTemporary;
    notifyListeners();
  }
}