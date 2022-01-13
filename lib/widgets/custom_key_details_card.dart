import 'package:flutter/material.dart';

class CustomKeyDetails extends StatelessWidget {
  final String? name;
  final String? breed;
  final int? years;
  final int? months;
  final String? description;
  final String? color;

  const CustomKeyDetails(
      {Key? key,
      @required this.name,
      @required this.breed,
      @required this.years,
      @required this.months,
      @required this.description,
      @required this.color})
      : super(key: key);

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
                            name!,
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
                            years.toString()+" years, "+months.toString()+" months",
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
                            breed!,
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
                            color!,
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
                  description!,
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
