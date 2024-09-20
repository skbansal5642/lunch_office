import 'package:flutter/material.dart';
import 'package:lunch_office/utils/common_text_form_field.dart';
import 'package:lunch_office/utils/constants.dart';

class SingleEditProfileField extends StatelessWidget {
  const SingleEditProfileField({
    super.key,
    required this.fieldController,
    required this.hintText,
    required this.title,
    required this.icon,
    this.validator,
    this.inputType,
    required this.focusNode,
    this.onTap,
    this.onTapTextField,
    this.isReadOnly = false,
    this.errorText = "",
  });

  final TextEditingController fieldController;
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final FocusNode focusNode;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final VoidCallback? onTapTextField;
  final String errorText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    if (!isReadOnly) {
      if (validator != null) {}
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: CommonTextFormFieldWidget(
                    focusNode: focusNode,
                    hintText: hintText,
                    controller: fieldController,
                    textAlign: TextAlign.end,
                    readOnly: isReadOnly,
                    inputDecoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    keyboardType: inputType,
                    onTapField: onTapTextField,
                  ),
                )
              ],
            ),
            const Divider(
              height: 2,
              thickness: 0,
              color: kAppGreyColor,
            ),
            if (errorText.isNotEmpty)
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
