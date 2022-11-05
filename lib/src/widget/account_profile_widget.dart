import 'package:flutter/material.dart';
import 'package:pekaku_app/src/model/user_model.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:provider/provider.dart';

class AccountProfileWidget extends StatelessWidget {
  const AccountProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountProvider =
    Provider.of<AccountViewModel>(context, listen: false);
    return FutureBuilder(
        future: accountProvider.specifyDataUSer(),
        builder: (context, snapshot) {
          final UserModel users = accountProvider.userModel;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Text('${users.name}'),
              Text('${users.alamat}'),
              Text('${users.tanggallahir}'),
              Text('${users.kelamin}'),
              Text('${users.email}'),
            ],
          );
        });
  }
}
