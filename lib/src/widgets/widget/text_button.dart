import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';

class ButtonText extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const ButtonText({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: MyColor.deepAqua,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: MyColor.deepAqua,
            ),
      ),
    );
  }
}
