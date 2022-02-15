import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/configs/firebase_data_service.dart';
import 'package:petpal/routes/route.dart' as route;
import 'package:petpal/widgets/custom_category_card.dart';
import 'package:petpal/widgets/custom_offer_card.dart';
import 'package:petpal/widgets/custom_post_card.dart';
import 'package:petpal/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:petpal/model/post_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 20,
        onPressed: () async =>
            Navigator.of(context).pushNamed(route.chooseAnimalAndBreedPage),
      ),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
                onPressed: () async {
                  var authServiceProvider =
                      Provider.of<AuthService>(context, listen: false);
                  await authServiceProvider.logOut();
                },
                icon: const Icon(EvaIcons.messageSquare)),
          ),
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(route.userProfilePage);
            },
            icon: const CircleAvatar(
              radius: 15,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomOfferCard(
                offerBanner: Image(
                  image: AssetImage("images/offer_banner.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Pet category",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/dog.png')),
                    categoryName: "Dog",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  ),
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/cat.png')),
                    categoryName: "Cat",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  ),
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/bird.png')),
                    categoryName: "Bird",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/rabbit.png')),
                    categoryName: "Rabbit",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  ),
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/fish.png')),
                    categoryName: "Fish",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  ),
                  CustomCategoryCard(
                    categoryImage:
                        const Image(image: AssetImage('images/horse.png')),
                    categoryName: "Horse",
                    containerWidth:
                        (MediaQuery.of(context).size.width - 100) / 3,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Recent posts",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseDataService().postStream(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something Went Wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomProgressIndicator();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          Post data = document.data()! as Post;
                          String docId = document.id;
                          return CustomPostCard(
                              displayImage: data.photoList != null
                                  ? data.photoList![0]
                                  : null,
                              onPressed: () async => Navigator.of(context)
                                  .pushNamed(route.postCardViewPage,
                                      arguments: [data]),
                              breed: data.breed,
                              name: data.name,
                              years: data.years,
                              months: data.months,
                              description: data.description);
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ListView(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// children: snapshot.data!.docs
//     .map((DocumentSnapshot document) {
// Post data = document.data()! as Post;
// return CustomPostCard(
// onPressed: () async => Navigator.of(context)
//     .pushNamed(route.postCardViewPage,arguments: [data]),
// breed: data.breed,
// name: data.name,
// years: data.years,
// months: data.months,
// description: data.description);
// }).toList());

// return CustomPostCard(
// onPressed: () async => Navigator.of(context)
// .pushNamed(route.postCardViewPage,arguments: [data]),
// breed: data.breed,
// name: data.name,
// years: data.years,
// months: data.months,
// description: data.description);

// snapshot.data!.docs
//     .map((DocumentSnapshot document) {
// Post data = document.data()! as Post;
// String docId=document.id;
// return CustomPostCard(
// onPressed: () async => Navigator.of(context)
//     .pushNamed(route.postCardViewPage,arguments: [data]),
// breed: data.breed,
// name: data.name,
// years: data.years,
// months: data.months,
// description: data.description);
// }).toList();
