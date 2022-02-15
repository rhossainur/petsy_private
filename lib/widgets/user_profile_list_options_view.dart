import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class UserProfileListOption extends StatelessWidget {
  const UserProfileListOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: const Text("Your posts"),
          leading: const Icon(EvaIcons.fileTextOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
        const SizedBox(height: 10,),
        ListTile(
          title: const Text("Send feedback"),
          leading: const Icon(EvaIcons.bookOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
        const SizedBox(height: 10,),
        ListTile(
          title: const Text("Contact us"),
          leading: const Icon(EvaIcons.emailOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
        const SizedBox(height: 10,),
        ListTile(
          title: const Text("Rate us on playstore"),
          leading: const Icon(EvaIcons.starOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
        const SizedBox(height: 15,),
        const Divider(),
        const SizedBox(height: 15,),
        const SizedBox(height: 10,),
        ListTile(
          title: const Text("About"),
          leading: const Icon(EvaIcons.infoOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
        const SizedBox(height: 10,),
        ListTile(
          title: const Text("Log out"),
          leading: const Icon(EvaIcons.logOutOutline,size: 30,color: Color(0xFF6db784),),
          onTap: (){},
        ),
      ],
    );
  }
}
