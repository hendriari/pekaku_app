import 'package:flutter/material.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/utils/custom_fonts.dart';

class SliverWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Function() onPressed;

  const SliverWidget({
    Key? key,
    required this.onPressed,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    return SliverAppBar(
      expandedHeight: 65,
      pinned: true,
      surfaceTintColor: MyColor.deepAqua,
      backgroundColor: MyColor.white,
      elevation: 1,
      flexibleSpace: FlexibleSpaceBar(
        title: RichText(
          text: TextSpan(
            text: text1,
            style:
                CustomFonts.customHeaderText.copyWith(color: MyColor.deepAqua),
            children: [
              TextSpan(
                text: text2,
                style: CustomFonts.customHeaderText.copyWith(
                  color: MyColor.deepAqua.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        titlePadding: EdgeInsets.only(top: paddingTop + 5, bottom: 5),
      ),
    );
  }
}