import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/model/user_model.dart';
import 'package:petpal/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class UserProfileDetailsSection extends StatefulWidget {
  const UserProfileDetailsSection({Key? key}) : super(key: key);

  @override
  State<UserProfileDetailsSection> createState() => _UserProfileDetailsSectionState();
}

class _UserProfileDetailsSectionState extends State<UserProfileDetailsSection> {
  FirebaseDataService firebaseDataService = FirebaseDataService();

  @override
  Widget build(BuildContext context) {
    final userId=context.read<AuthService>().getCurrentUser();
    return GestureDetector(
      onTap: (){
      },
      child: FutureBuilder<DocumentSnapshot>(
        future: firebaseDataService.getUser(userId.uid),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("Error hj");
            }
          if(snapshot.connectionState==ConnectionState.waiting){
            return CustomProgressIndicator();
          }
          User userData=snapshot.data!.data() as User ;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         userData.name!=null?Text(userData.name!,style: Theme.of(context).textTheme.headline5,):Text("User",style: Theme.of(context).textTheme.headline5,),
                         userData.email!=null?Text(userData.email!,style: Theme.of(context).textTheme.subtitle1,):Text(userData.phone!,style: Theme.of(context).textTheme.subtitle1,),
                        //Text(userData!.id,style: Theme.of(context).textTheme.headline5,)
                      ],
                    ),
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("images/dog_post_test.jpg"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              const Divider(height: 5,)
            ],
          );
        }
      ),
    );
  }
}
