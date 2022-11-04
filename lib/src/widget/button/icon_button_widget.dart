import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function() onTap;
  final double heightContainer;
  final double widthContainer;
  final IconData icon;
  final Color? color;
  final Color borderColor;
  final Color? iconColor;

  const IconButtonWidget({
    Key? key,
    required this.onTap,
    required this.heightContainer,
    required this.widthContainer,
    required this.icon,
    required this.borderColor,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: heightContainer,
        width: widthContainer,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}