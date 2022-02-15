import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/configs/image_picker.dart';
import 'package:petpal/model/post_model.dart';
import 'package:petpal/widgets/custom_progress_indicator.dart';
import 'package:petpal/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:petpal/routes/route.dart' as route;

class CreatePost extends StatefulWidget {
  final String? animal;
  final String? breed;

  const CreatePost({Key? key, this.animal, this.breed}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _formKey = GlobalKey<FormState>();
  String? postType;
  String? selectedAnimalStr;
  String? selectedBreedStr;
  bool breedNullable = false;
  File? imagePicked1,
      imagePicked2,
      imagePicked3,
      imagePicked4,
      imagePicked5,
      imagePicked6;
  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool progressIndicator = false;
  int progressCounter = 0;
  String? documentId;
  bool postButtonState=true;
  List<String?> photoDownloadUrlList=[];

  @override
  void dispose() {
    nameController.dispose();
    colorController.dispose();
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
            Builder(builder: (context) {
              return TextButton(
                  onPressed:postButtonState==true? () async {
                    String docCreationCurrentDateAndTime=DateTime.now().millisecondsSinceEpoch.toString();
                    setState(() {
                      postButtonState=false;
                    });
                    if (_formKey.currentState!.validate() && postType != null) {
                      setState(() {
                        progressIndicator = true;
                        progressCounter += 1;
                        if (imagePicked1 != null) {
                          progressCounter += 1;
                        }
                        if (imagePicked2 != null) {
                          progressCounter += 1;
                        }
                        if (imagePicked3 != null) {
                          progressCounter += 1;
                        }
                        if (imagePicked4 != null) {
                          progressCounter += 1;
                        }
                        if (imagePicked5 != null) {
                          progressCounter += 1;
                        }
                        if (imagePicked6 != null) {
                          progressCounter += 1;
                        }
                      });
                      final user = context.read<AuthService>().getCurrentUser();
                      if (imagePicked1 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked1, docCreationCurrentDateAndTime, user.uid, 1)
                            .then((value) {
                              String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                              photoDownloadUrlList.add(val);
                              progressCounter -= 1;
                            });
                      }
                      if (imagePicked2 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked2, docCreationCurrentDateAndTime, user.uid, 2)
                            .then((value) {
                          String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                          photoDownloadUrlList.add(val);
                          progressCounter -= 1;
                        });
                      }
                      if (imagePicked3 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked3, docCreationCurrentDateAndTime, user.uid, 3)
                            .then((value)  {
                          String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                          photoDownloadUrlList.add(val);
                          progressCounter -= 1;
                        });
                      }
                      if (imagePicked4 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked4, docCreationCurrentDateAndTime, user.uid, 4)
                            .then((value)  {
                          String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                          photoDownloadUrlList.add(val);
                          progressCounter -= 1;
                        });
                      }
                      if (imagePicked5 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked5, docCreationCurrentDateAndTime, user.uid, 5)
                            .then((value)  {
                          String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                          photoDownloadUrlList.add(val);
                          progressCounter -= 1;
                        });
                      }
                      if (imagePicked6 != null) {
                        await context
                            .read<ImagePickingService>()
                            .uploadImage(imagePicked6, docCreationCurrentDateAndTime, user.uid, 6)
                            .then((value)  {
                          String? val=context.read<ImagePickingService>().downloadUrl;
                          print("image url : "+val!);
                          photoDownloadUrlList.add(val);
                          progressCounter -= 1;
                        });
                      }
                      Post post = Post(
                          name: nameController.text,
                          createDateAndTime: Timestamp.now(),
                          description: descriptionController.text,
                          breed: widget.breed,
                          color: colorController.text,
                          animal: widget.animal,
                          months: int.parse(monthsController.text),
                          userId: user.uid,
                          photoList: photoDownloadUrlList,
                          postType: postType,
                          years: int.parse(yearsController.text));
                      FirebaseDataService firebaseDataService =
                      FirebaseDataService();
                      await firebaseDataService
                          .addPost(post)
                          .then((documentReference) {
                        documentId = documentReference.id;
                        progressCounter -= 1;
                      });
                      nameController.clear();
                      colorController.clear();
                      yearsController.clear();
                      monthsController.clear();
                      descriptionController.clear();
                      imagePicked1 = null;
                      imagePicked2 = null;
                      imagePicked3 = null;
                      imagePicked4 = null;
                      imagePicked5 = null;
                      imagePicked6 = null;
                      postType = null;
                      setState(() {
                        if (progressCounter == 0) {
                          progressIndicator = false;
                          postButtonState=true;
                        }
                      });
                      progressCounter == 0
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Color(0xFF6db784),
                                duration: Duration(seconds: 2),
                                content: Text('Post Created Successfully'),
                              ),
                            )
                          : Container();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          route.driverClass, (route) => false);
                    } else if (postType == null &&
                        _formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF6db784),
                          duration: Duration(seconds: 2),
                          content: Text('Choose a post type'),
                        ),
                      );
                      setState(() {
                        postButtonState=true;
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF6db784),
                          duration: Duration(seconds: 2),
                          content: Text('Something Wrong'),
                        ),
                      );
                      setState(() {
                        postButtonState=true;
                      });
                    }
                  }:null,
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
            }),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
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
                        style: Theme.of(context).textTheme.headline6,
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
                                postType = "Donor";
                              });
                            },
                            selected: postType == "Donor",
                          )),
                          Expanded(
                              child: ChoiceChip(
                            label: const Text(
                              "Seller",
                              style: TextStyle(fontSize: 17),
                            ),
                            onSelected: (bool val) {
                              setState(() {
                                postType = "Seller";
                              });
                            },
                            selected: postType == "Seller",
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.headline6,
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
                          hintText: "Add name",
                          textInputType: TextInputType.name),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Color",
                        style: Theme.of(context).textTheme.headline6,
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
                          hintText: "Add color",
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Age",
                        style: Theme.of(context).textTheme.headline6,
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
                        style: Theme.of(context).textTheme.headline6,
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
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 3,
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
                                      ? Image.file(
                                          imagePicked1!,
                                          fit: BoxFit.cover,
                                        )
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
                                      ? Image.file(
                                          imagePicked2!,
                                          fit: BoxFit.cover,
                                        )
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
                                      ? Image.file(
                                          imagePicked3!,
                                          fit: BoxFit.cover,
                                        )
                                      : const Placeholder(),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 3,
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
                                      ? Image.file(
                                          imagePicked4!,
                                          fit: BoxFit.cover,
                                        )
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
                                      ? Image.file(
                                          imagePicked5!,
                                          fit: BoxFit.cover,
                                        )
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
                                      ? Image.file(
                                          imagePicked6!,
                                          fit: BoxFit.cover,
                                        )
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
            Visibility(
              visible: progressIndicator,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 5,
                  sigmaX: 5
                ),
                child: Container(),
              ),
            ),
            Visibility(
              visible: progressIndicator,
              child: const Center(
                child: CustomProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
