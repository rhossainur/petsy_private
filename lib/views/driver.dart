import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/model/user_model.dart' as user_model;
import 'package:petpal/views/home.dart';
import 'package:petpal/views/login_signup.dart';
import 'package:petpal/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:petpal/routes/route.dart' as routes;

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  FirebaseDataService firebaseDataService = FirebaseDataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: context.read<AuthService>().user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Scaffold(body: CustomProgressIndicator()),
              );
            } else if (snapshot.hasData) {
              print(snapshot.data);
              user_model.User data = snapshot.data as user_model.User;
              if (data.loginMethod == "phone") {
                firebaseDataService
                    .getUser(data.uid!)
                    .then((DocumentSnapshot doc) {
                  if (!doc.exists) {
                    Navigator.of(context).pushNamed(
                        routes.phoneAuthNameRequirementPage,
                      arguments: [data]
                    );
                  }
                  else {
                    return Driver();
                  }
                });
              } else {
                firebaseDataService
                    .getUser(data.uid!)
                    .then((DocumentSnapshot doc) {
                  if (!doc.exists) {
                    print("entered unnecessary");
                    firebaseDataService.addUser(data);
                  }
                  return Driver();
                });
              }
              return Home();

            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error diche"),
              );
            } else {
              return const LoginSignup();
            }
          }),
    );
  }
}
