import 'package:flutter/material.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmersLoading extends StatelessWidget {
  final Widget child;

  const ShimmersLoading({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColor.outlineBorder,
      highlightColor: MyColor.white,
      child: child,
    );
  }
}
