import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/configs/image_picker.dart';
import 'package:petpal/model/post_model.dart';
import 'package:petpal/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
  int choice = 0;
  File? imagePicked1,
      imagePicked2,
      imagePicked3,
      imagePicked4,
      imagePicked5,
      imagePicked6;
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    colorController.dispose();
    breedController.dispose();
    yearsController.dispose();
    monthsController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Post"),
          actions: [
            FutureBuilder(
              future:null,
              builder: (context,snapshot) {
                return TextButton(
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        final user = context.read<AuthService>().getCurrentUser();
                        Post post = Post(name: nameController.text,
                            description: descriptionController.text,
                            breed: breedController.text,
                            color: colorController.text,
                            animal: "Cat",
                            months: int.parse(monthsController.text),
                            userId: user.uid,
                            type: choice,
                            years: int.parse(yearsController.text));
                        FirebaseDataService firebaseDataService = FirebaseDataService();
                        await firebaseDataService.addPost(post);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text('Post Created Successfully'),
                          ),
                        );
                      }

                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      children: const [
                        Icon(
                          EvaIcons.paperPlane,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Post"),
                      ],
                    ));
              }
            ),
          ],
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Post Type",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ChoiceChip(
                            label: const Text(
                              "Donor",
                              style: TextStyle(fontSize: 17),
                            ),
                            onSelected: (bool val) {
                              setState(() {
                                choice = 1;
                              });
                            },
                            selected: choice == 1,
                          )),
                      Expanded(
                          child: ChoiceChip(
                            label: const Text(
                              "Seller",
                              style: TextStyle(fontSize: 17),
                            ),
                            onSelected: (bool val) {
                              setState(() {
                                choice = 2;
                              });
                            },
                            selected: choice == 2,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Name",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      textEditingController: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintText: "Add name", textInputType: TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Color",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      textEditingController: colorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintText: "Add color", textInputType: TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Breed",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      textEditingController: breedController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      hintText: "Add Breed", textInputType: TextInputType.name),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Age",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CustomTextField(
                              textEditingController: yearsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              hintText: "years",
                              textInputType: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CustomTextField(
                              textEditingController: monthsController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              hintText: "months",
                              textInputType: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Description",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    textEditingController: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    hintText: "Add Description",
                    textInputType: TextInputType.multiline,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Photos",
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked1 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked1 != null
                                      ? Image.file(imagePicked1!)
                                      : const Placeholder(),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked2 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked2 != null
                                      ? Image.file(imagePicked2!)
                                      : const Placeholder(),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked3 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked3 != null
                                      ? Image.file(imagePicked3!)
                                      : const Placeholder(),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width / 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked4 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked4 != null
                                      ? Image.file(imagePicked4!)
                                      : const Placeholder(),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked5 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked5 != null
                                      ? Image.file(imagePicked5!)
                                      : const Placeholder(),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ImagePickingService>()
                                  .pickImage();
                              setState(() {
                                imagePicked6 = context
                                    .read<ImagePickingService>()
                                    .imagePicked;
                              });
                            },
                            child: Card(
                                child: Container(
                                  child: imagePicked6 != null
                                      ? Image.file(imagePicked6!)
                                      : const Placeholder(),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
