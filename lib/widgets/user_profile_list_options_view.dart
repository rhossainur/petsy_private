import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class UserProfileListOption extends StatelessWidget {
  const UserProfileListOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const[
        ListTile(
          title: Text("Your posts"),
          leading: Icon(EvaIcons.fileTextOutline,size: 30,color: Color(0xFF6db784),),
        ),
        SizedBox(height: 10,),
        ListTile(
          title: Text("Send feedback"),
          leading: Icon(EvaIcons.bookOutline,size: 30,color: Color(0xFF6db784),),
        ),
        SizedBox(height: 10,),
        ListTile(
          title: Text("Contact us"),
          leading: Icon(EvaIcons.emailOutline,size: 30,color: Color(0xFF6db784),),
        ),
        SizedBox(height: 10,),
        ListTile(
          title: Text("Rate us on playstore"),
          leading: Icon(EvaIcons.starOutline,size: 30,color: Color(0xFF6db784),),
        ),
        SizedBox(height: 15,),
        Divider(),
        SizedBox(height: 15,),
        SizedBox(height: 10,),
        ListTile(
          title: Text("About"),
          leading: Icon(EvaIcons.infoOutline,size: 30,color: Color(0xFF6db784),),
        ),
        SizedBox(height: 10,),
        ListTile(
          title: Text("Log out"),
          leading: Icon(EvaIcons.logOutOutline,size: 30,color: Color(0xFF6db784),),
        ),
      ],
    );
  }
}
