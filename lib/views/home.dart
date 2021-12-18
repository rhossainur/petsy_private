import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:petpal/configs/auth_service.dart';
import 'package:petpal/routes/route.dart' as route;
import 'package:petpal/widgets/custom_category_card.dart';
import 'package:petpal/widgets/custom_offer_card.dart';
import 'package:petpal/widgets/custom_post_card.dart';
import 'package:provider/provider.dart';

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
            Navigator.of(context).pushNamed(route.createPostPage),
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
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 11, 0),
            child: CircleAvatar(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPostCard(
                    onPressed: () async =>
                        Navigator.of(context).pushNamed(route.postCardViewPage),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
