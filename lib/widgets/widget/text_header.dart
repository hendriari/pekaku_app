import 'package:flutter/material.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/utils/custom_fonts.dart';

Widget textHeader(String text1, String text2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: CustomFonts.customHeaderText.copyWith(color: MyColor.deepAqua),
      children: [
        TextSpan(
          text: text2,
          style: CustomFonts.customHeaderText.copyWith(
            color: MyColor.deepAqua.withOpacity(.6),
          ),
        ),
      ],
    ),
  );
}
