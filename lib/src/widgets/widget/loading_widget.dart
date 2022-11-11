import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pekaku_app/src/utils/colors.dart';

Widget showLoading(){
  return SpinKitSpinningLines(
    color: MyColor.deepAqua,
  );
}
