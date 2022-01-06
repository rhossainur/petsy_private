import 'package:flutter/material.dart';
import 'package:petpal/configs/auto_complete_service_data.dart';
import 'package:petpal/widgets/custom_elevated_button.dart';
import 'package:petpal/widgets/custom_type_ahead_text_field.dart';
import 'package:petpal/routes/route.dart' as route;

class ChooseAnimalAndBreed extends StatefulWidget {
  const ChooseAnimalAndBreed({Key? key}) : super(key: key);

  @override
  _ChooseAnimalAndBreedState createState() => _ChooseAnimalAndBreedState();
}

class _ChooseAnimalAndBreedState extends State<ChooseAnimalAndBreed> {
  final _formKey = GlobalKey<FormState>();
  String? selectedAnimalStr;
  String? selectedBreedStr;
  bool breedNullable = false;
  TextEditingController animalController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  List<String> Function(String)? breedSuggestionCallBackFunction;

  @override
  void dispose() {
    animalController.dispose();
    breedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Post"),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Animal",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTypeAheadTextField(
                    hintText: "Choose Animal",
                    onTap: () {
                      setState(() {
                        selectedAnimalStr = null;
                        selectedBreedStr = null;
                      });
                    },
                    onFocusChange: (focus) {
                      if (selectedAnimalStr == null) {
                        setState(() {
                          animalController.clear();
                          breedController.clear();
                        });
                      }
                    },
                    textEditingController: animalController,
                    suggestionsCallback: AnimalSuggestion.getSuggestions,
                    itemBuilder: (context, String? suggestions) {
                      return ListTile(
                        title: Text(suggestions!),
                      );
                    },
                    onSuggestionsSelected: (String? value) {
                      animalController.text = value!;
                      setState(() {
                        selectedAnimalStr = value;
                        if (value == "Dog") {
                          breedSuggestionCallBackFunction =
                              DogSuggestion.getSuggestions;
                        } else if (value == "Cat") {
                          breedSuggestionCallBackFunction =
                              CatSuggestion.getSuggestions;
                        } else {
                          breedSuggestionCallBackFunction =
                              OthersSuggestion.getSuggestions;
                        }
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  selectedAnimalStr != null
                      ? const SizedBox(
                          height: 30,
                        )
                      : Container(),
                  selectedAnimalStr != null
                      ? Text(
                          "Breed",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      : Container(),
                  selectedAnimalStr != null
                      ? const SizedBox(
                          height: 20,
                        )
                      : Container(),
                  selectedAnimalStr != null
                      ? CustomTypeAheadTextField(
                          hintText: "Choose breed",
                          onTap: () {
                            setState(() {
                              selectedBreedStr = null;
                            });
                          },
                          onFocusChange: (focus) {
                            if (selectedBreedStr == null) {
                              setState(() {
                                breedController.clear();
                              });
                            }
                          },
                          textEditingController: breedController,
                          suggestionsCallback: breedSuggestionCallBackFunction!,
                          itemBuilder: (context, String? suggestions) {
                            return ListTile(
                              title: Text(suggestions!),
                            );
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onSuggestionsSelected: (String? value) {
                            breedController.text = value!;
                            setState(() {
                              selectedBreedStr = value;
                            });
                          })
                      : Container(),
                  const SizedBox(
                    height: 50,
                  ),
                  selectedBreedStr != null
                      ? CustomElevatedButton(
                          childText: "Next",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context)
                                  .pushNamed(route.createPostPage, arguments: [
                                selectedAnimalStr,
                                selectedBreedStr
                              ]);
                            }
                          })
                      : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// FocusScope(
// onFocusChange: (focus){
// if(selectedAnimalStr==null){
// animalController.clear();
// }
// },
// child: TypeAheadFormField<String?>(
// textFieldConfiguration: TextFieldConfiguration(
// onTap: (){
// selectedAnimalStr=null;
// },
// controller: animalController,
// decoration: InputDecoration(
// hintText: "Choose animal",
// filled: true,
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(7),
// borderSide: BorderSide.none)),
// ),
// suggestionsCallback: AnimalSuggestion.getSuggestions,
// itemBuilder: (context, String? suggestion) {
// return ListTile(
// title: Text(suggestion!),
// );
// },
// onSuggestionSelected: (String? value){
// animalController.text=value!;
// setState(() {
// selectedAnimalStr=value;
// });
// },
// validator: (value){
// if (value == null || value.isEmpty) {
// return 'Please enter some text';
// }
// return null;
// },
// ),
// ),
