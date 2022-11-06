import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/widget/account_widget/account_profile_widget.dart';
import 'package:pekaku_app/src/widget/account_widget/shimmer_profile_loading.dart';
import 'package:pekaku_app/src/widget/widget/shimmer_widget.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountViewModel>(context, listen: false);

    /// get data secara realtime
    return Scaffold(
      body: StreamBuilder(
        stream: accountProvider.userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmersLoading(
              child: ShimmerProfileLoading(),
            );
          }
          if (snapshot.hasData) {
            return AccountProfileWidget(
              imageUser: '${(snapshot.data as DocumentSnapshot)['image']}',
              textNameHeader: '${(snapshot.data as DocumentSnapshot)['name']}',
              textEmailUser: '${(snapshot.data as DocumentSnapshot)['email']}',
              nameTextForm: '${(snapshot.data as DocumentSnapshot)['name']}',
              tanggalLahirTextForm:
                  '${(snapshot.data as DocumentSnapshot)['tanggallahir']}',
              jenisKelaminTextForm:
                  '${(snapshot.data as DocumentSnapshot)['kelamin']}',
              alamatTextForm:
                  '${(snapshot.data as DocumentSnapshot)['alamat']}',
            );
          }
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sorry an error occurred',
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.faceSadCry,
                  color: MyColor.deepAqua,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
