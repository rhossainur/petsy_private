import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/widgets/custom_elevated_button.dart';
import 'package:petpal/widgets/custom_text_field.dart';
import 'package:petpal/routes/route.dart' as routes;
import 'package:provider/provider.dart';
import 'package:petpal/model/user_model.dart' as user_model;

class PhoneAuthenticationNameRequirement extends StatefulWidget {
  final user_model.User user;

  const PhoneAuthenticationNameRequirement({Key? key,required this.user})
      : super(key: key);

  @override
  _PhoneAuthenticationNameRequirementState createState() =>
      _PhoneAuthenticationNameRequirementState();
}

class _PhoneAuthenticationNameRequirementState
    extends State<PhoneAuthenticationNameRequirement> {
  TextEditingController phoneAuthNameAddTextController =
      TextEditingController();
  FirebaseDataService firebaseDataService = FirebaseDataService();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneAuthNameAddTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var authServiceProvider =
            Provider.of<AuthService>(context, listen: false);
        await authServiceProvider.logOut();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Personal Information"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              var authServiceProvider =
                  Provider.of<AuthService>(context, listen: false);
              await authServiceProvider.logOut();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                CustomTextField(
                    hintText: "Enter Name",
                    textInputType: TextInputType.name,
                    validator: (value){
                      if(value==null||value==""||value.length<3||value.trim()==""){
                        return "PLease enter a valid name";
                      }
                      return null;
                    },
                    textEditingController: phoneAuthNameAddTextController),
                CustomElevatedButton(
                    childText: "Next",
                    onPressed: () async {
                      String name=phoneAuthNameAddTextController.text.trim();
                      user_model.User? userTemp = user_model.User(
                          name: phoneAuthNameAddTextController.text,
                          email: widget.user.email,
                          phone: widget.user.phone,
                          profileImageUrl: widget.user.profileImageUrl,
                          uid: widget.user.uid,
                          creationTime: widget.user.creationTime,
                          emailVerified: widget.user.emailVerified??false,
                          lastSignInTime: widget.user.lastSignInTime,
                        loginMethod: widget.user.loginMethod
                      );
                      await firebaseDataService.addUser(userTemp).then((value){
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            routes.driverClass, (route) => false);
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
