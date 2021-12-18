import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  final Image? categoryImage;
  final String? categoryName;
  final double? containerWidth;

  const CustomCategoryCard(
      {Key? key,
      @required this.categoryImage,
      @required this.categoryName,
      @required this.containerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: containerWidth,
            decoration: const BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: 70,
            child: Center(
              child: categoryImage,
            ),
          ),
          Container(
            height: 40,
            width: containerWidth,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Center(
              child: Text(
                categoryName.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
