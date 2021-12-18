import 'package:flutter/material.dart';
import 'package:petpal/routes/route.dart' as route;

class OtherProfile extends StatefulWidget {
  const OtherProfile({Key? key}) : super(key: key);

  @override
  _OtherProfileState createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Profile"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Goto login"),
          onPressed: ()=>Navigator.pushNamed(context, route.loginSignupPage),
        ),
      ),
    );
  }
}
