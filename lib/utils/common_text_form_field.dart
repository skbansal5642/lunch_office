import 'package:flutter/material.dart';
import 'package:lunch_office/utils/constants.dart';

/// This will create a text form field of fixed theme.
///
/// It includes all the necessary parameters,
/// those are optional and can be added only when needed.
///
/// `focusNode` can be assigned as simple `FocusNode()` if we do not need to perform any action on it.
///
class CommonTextFormFieldWidget extends StatefulWidget {
  final FocusNode focusNode;
  final String? labelText;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final VoidCallback? onToggleVisibility;
  final int maxlines;
  final String? initialValue;
  final bool readOnly;
  final Function()? onTapField;
  final Function(String)? onChangeTextFieldValue;
  final Widget? prefixIcon;
  final InputDecoration? inputDecoration;
  final TextAlign textAlign;

  const CommonTextFormFieldWidget({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.controller,
    this.labelText,
    this.suffixIcon,
    this.obscureText = false,
    this.errorText,
    this.validator,
    this.keyboardType,
    this.onToggleVisibility,
    this.maxlines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTapField,
    this.onChangeTextFieldValue,
    this.prefixIcon,
    this.inputDecoration,
    this.textAlign = TextAlign.start,
  });

  @override
  State<CommonTextFormFieldWidget> createState() => _CommonTextFormFieldWidgetState();
}

class _CommonTextFormFieldWidgetState extends State<CommonTextFormFieldWidget> {
  bool hasError = false;

  onTapField() {
    setState(() {
      FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      maxLines: widget.maxlines,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      cursorHeight: 25,
      textAlign: widget.textAlign,
      decoration: widget.inputDecoration ??
          InputDecoration(
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              borderSide: BorderSide(color: kErrorColor),
            ),
            errorStyle: const TextStyle(color: kErrorColor),
            errorText: widget.errorText,
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              borderSide: BorderSide(color: kErrorColor),
            ),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: widget.focusNode.hasFocus ? kAppThemeDarkColor : kAppThemeColor),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              borderSide: BorderSide(color: kAppThemeColor),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              borderSide: BorderSide(color: kAppThemeColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.0)),
              borderSide: BorderSide(color: kAppThemeDarkColor),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: kAppThemeColor),
            focusColor: Colors.black,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            alignLabelWithHint: true,
            prefixIcon: widget.prefixIcon,
          ),
      onSaved: (newValue) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: widget.onTapField ?? onTapField,
      onChanged: widget.onChangeTextFieldValue,
    );
  }
}
