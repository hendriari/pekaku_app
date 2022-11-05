import 'package:flutter/material.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/widget/account_widget/account_profile_widget.dart';
import 'package:pekaku_app/src/widget/account_widget/shimmer_profile_loading.dart';
import 'package:pekaku_app/src/widget/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
          future: accountProvider.specifyDataUSer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmersLoading(
                child: ShimmerProfileLoading(),
              );
            }
            return const AccountProfileWidget();
          }),
    );
  }
}
