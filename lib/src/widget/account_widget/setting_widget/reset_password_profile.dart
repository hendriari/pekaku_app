import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/forgot_password_provider.dart';
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
                context.read<AccountViewModel>().checkerEmail();
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
