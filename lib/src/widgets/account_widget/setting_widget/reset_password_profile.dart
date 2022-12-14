import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/account_view_model.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:provider/provider.dart';

Future resetPasswordProfileDialog(BuildContext context) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            'Yakin Reset Password ?',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Batal',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: MyColor.deepAqua),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () {
                AccountViewModel().checkerEmail();
                context.read<NavigasiViewModel>().navigasiBack(context);
              },
              child: Text(
                'Reset',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: MyColor.errorColor),
              ),
            ),
          ],
        );
      });
}
