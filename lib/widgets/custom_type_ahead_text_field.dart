import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomTypeAheadTextField extends StatelessWidget {
  final void Function()? onTap;
  final Color? fillColor;
  final String? hintText;
  final List<String> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, String?) itemBuilder;
  final TextEditingController textEditingController;
  final void Function(String?) onSuggestionsSelected;
  final String? Function(String?)? validator;
  final void Function(bool)? onFocusChange;

  const CustomTypeAheadTextField(
      {Key? key,
      this.onTap,
      required this.textEditingController,
      this.fillColor,
      this.hintText,
      required this.suggestionsCallback,
      required this.itemBuilder,
      required this.onSuggestionsSelected,
      this.validator,
      this.onFocusChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: onFocusChange,
      child: TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          onTap: onTap,
          controller: textEditingController,
          decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: fillColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide.none)),
        ),
        suggestionsCallback: suggestionsCallback,
        itemBuilder: itemBuilder,
        onSuggestionSelected: onSuggestionsSelected,
        validator: validator,
      ),
    );
  }
}
