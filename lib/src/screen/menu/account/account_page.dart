import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/model/user_model.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:pekaku_app/src/widget/account_profile_widget.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           const AccountProfileWidget(),

            ///
            Consumer<AuthViewModel>(builder: (context, value, child) {
              return Text(value.currentUser?.email ?? 'User email');
            }),

            ///
            ElevatedButton(
              onPressed: () async {
                context.read<AuthViewModel>().signOut();
              },
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
