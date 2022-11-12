import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/services/account_services/account_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
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
                context.read<AccountServices>().logOut();
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
