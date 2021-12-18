import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      @required this.hintText,
      @required this.textInputType,
      this.textAlign = TextAlign.left,
      this.onChanged,
      this.fillColor,
      this.inputFormatter, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlign: textAlign,
      minLines: 1,
      maxLines: maxLines??1,
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide.none)),
    );
  }
}
