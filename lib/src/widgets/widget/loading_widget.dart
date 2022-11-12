import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pekaku_app/src/utils/colors.dart';

class LoadingWidget {

  /// deep aqua laoding color
  static Widget deepLoading = SpinKitSpinningLines(
    color: MyColor.deepAqua,
  );

  /// white loading color
  static Widget whiteButtonLoading = SpinKitSpinningLines(
    color: MyColor.white,
    size: 45,
  );
}
