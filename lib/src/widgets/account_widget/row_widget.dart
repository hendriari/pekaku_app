import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';

Widget rowWidget({
  context,
  required IconData icon,
  required String text,
  required Function() onTap,
}) {
  return InkWell(
    splashColor: MyColor.lichen,
    borderRadius: BorderRadius.circular(20),
    onTap: onTap,
    child: Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: MyColor.marble,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: MyColor.deepAqua,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: MyColor.deepAqua),
        ),
        const Spacer(),
        Icon(
          CupertinoIcons.arrowtriangle_right,
          color: MyColor.deepAqua,
        ),
      ],
    ),
  );
}
