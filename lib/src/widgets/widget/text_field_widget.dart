import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';

class TextFormFields extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final String? label;
  final TextInputAction? textInputAction;

  const TextFormFields({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.hintText,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.label,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.deepAqua,
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(
          '$label',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: MyColor.deepAqua),
        ),
        filled: true,
        fillColor: MyColor.border,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.errorColor,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.deepAqua,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColor.outlineBorder,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
