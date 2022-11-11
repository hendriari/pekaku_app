import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_view_model.dart';
import 'package:pekaku_app/src/view_model/navigasi_view_model/navigasi_view_model.dart';
import 'package:provider/provider.dart';

Future logoutDialog(BuildContext context) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            'Logout ?',
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
                context.read<AccountViewModel>().logOut();
                ///context.read<AuthViewModel>().signOut();
                context.read<NavigasiViewModel>().navigasiBack(context);
              },
              child: Text(
                'Logout',
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
