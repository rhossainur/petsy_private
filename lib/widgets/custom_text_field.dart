import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputType? textInputType;
  final TextAlign textAlign;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  const CustomTextField(
      {Key? key,
      @required this.hintText,
      @required this.textInputType,
      this.textAlign = TextAlign.left,
      this.onChanged,
      this.fillColor,
      this.inputFormatter, this.maxLines, this.validator, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
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
