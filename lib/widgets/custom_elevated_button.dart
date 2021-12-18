import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? childText;
  final GestureTapCallback? onPressed;

  const CustomElevatedButton({
    Key? key,
    @required this.childText,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(childText.toString()),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          elevation: 0,
        ),
      ),
    );
  }
}
