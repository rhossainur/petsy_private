import 'package:flutter/material.dart';

class CustomOfferCard extends StatelessWidget {
  final Image? offerBanner;
  const CustomOfferCard({Key? key,@required this.offerBanner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: Center(
          child: offerBanner,
        ),
        height: 120,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 27, 77, 137),
              Color.fromARGB(235, 27, 77, 137),
              Color.fromARGB(215, 27, 77, 137)
            ]),
            borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
