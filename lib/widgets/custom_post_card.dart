import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomPostCard extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? breed;
  final String? name;
  final int? years;
  final int? months;
  final String? description;

  const CustomPostCard({Key? key,@required this.onPressed,@required this.breed,@required this.name,@required this.years,@required this.months,@required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [Icon(EvaIcons.heartOutline)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(breed!),
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  )
                ],
              ),
              height: 230,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/dog_post_test.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Container(
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name!,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Container(
                          height: 30,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(years.toString()+" years, "+months.toString()+" months"),
                          )),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 249, 228, 91),
                                Color.fromARGB(235, 249, 228, 91),
                                Color.fromARGB(215, 249, 228, 91)
                              ]),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                    child: Text(
                      description!,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 27, 77, 137),
                            Color.fromARGB(235, 27, 77, 137),
                            Color.fromARGB(215, 27, 77, 137)
                          ]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Row(
                          children: const [
                            Icon(Icons.ac_unit_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text("5000+ views")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
