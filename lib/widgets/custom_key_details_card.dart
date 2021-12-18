import 'package:flutter/material.dart';

class CustomKeyDetails extends StatelessWidget {
  const CustomKeyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Key Details",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Bhombol",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Age",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "5 years 3 months",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Breed",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Golden Retriever",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Golden",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "The Golden Retriever is one of 🌷🌷the most 🌷popular dog breeds in the 🌷United States. The breed’s friendly, tolerant🌷 attitude makes them great family pets, and their intelligence 🌷 makes them highly capable 🌷 working dogs. Golden Retrievers 🌷 excel at retrieving game for hunters, tracking, 🌷 sniffing out contraband for law enforcement, and as therapy and service dogs. They’re also natural athletes and do well in dog sports such as agility and competitive obedience. These dogs are fairly easy to train and get along in just about any home or family. They’re great with kids and very protective of their humans. If you want a loyal, loving, and smart companion, then you should consider adopting one of these pups into your pack.",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
