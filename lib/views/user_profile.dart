import 'package:flutter/material.dart';
import 'package:petpal/routes/route.dart' as route;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("user profile"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Goto other profile"),
          onPressed: ()=>Navigator.pushNamed(context, route.othersProfilePage),
        ),
      ),
    );
  }
}
