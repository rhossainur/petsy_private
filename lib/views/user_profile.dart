import 'package:flutter/material.dart';
import 'package:petpal/routes/route.dart' as route;
import 'package:petpal/widgets/user_profile_details_section_view.dart';
import 'package:petpal/widgets/user_profile_fav_notification_setting_section_view.dart';
import 'package:petpal/widgets/user_profile_list_options_view.dart';

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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: UserProfileDetailsSection(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
                children: const [
                  UserProfileFavNotificationSettingSection(),
                  UserProfileListOption(),
                  SizedBox(height: 250,)
                ],
              ),
      ),

    );
  }
}


// CustomScrollView(
// slivers: [
// SliverAppBar(
// pinned: true,
// flexibleSpace: FlexibleSpaceBar(
// background: UserProfileDetailsSection()
// ),
// )
// ],
// )

// AppBar(
// bottom: PreferredSize(
// preferredSize: Size.fromHeight(80),
// child: UserProfileDetailsSection(),
// ),
// ),