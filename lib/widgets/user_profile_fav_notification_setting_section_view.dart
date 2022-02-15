import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class UserProfileFavNotificationSettingSection extends StatelessWidget {
  const UserProfileFavNotificationSettingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(EvaIcons.heartOutline)),
                  Text("Favourite")
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(EvaIcons.bellOutline)),
                  Text("Notifications")
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon:const Icon(EvaIcons.settingsOutline)),
                  Text("Settings")
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
