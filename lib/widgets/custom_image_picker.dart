import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petpal/configs/image_picker.dart';
import 'package:provider/provider.dart';

class CustomImagePicker extends StatefulWidget{
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? imagePicked;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async{
        await context.read<ImagePickingService>().pickImage();
        setState(() {
          imagePicked= context.read<ImagePickingService>().imagePicked;
        });
      },
      child: Card(
        child: Container(
          child: imagePicked!=null?Image.file(imagePicked!):const Placeholder(),
        )
      ),
    );
  }

}
