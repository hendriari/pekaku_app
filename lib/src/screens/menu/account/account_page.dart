import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/services/account_services/account_services.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/widgets/account_widget/account_profile_widget.dart';
import 'package:pekaku_app/src/widgets/account_widget/shimmer_profile_loading.dart';
import 'package:pekaku_app/src/widgets/widget/shimmer_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<AccountServices>(context, listen: false);

    /// get data secara realtime
    return Scaffold(
      backgroundColor: MyColor.white,
      body: StreamBuilder(
        stream: userData.userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmersLoading(
              child: ShimmerProfileLoading(),
            );
          }
          if (snapshot.hasData) {
            return AccountProfileWidget(
              imageUser: '${(snapshot.data as DocumentSnapshot)['photoUrl']}',
              textNameHeader: '${(snapshot.data as DocumentSnapshot)['username']}',
              textEmailUser: '${(snapshot.data as DocumentSnapshot)['email']}',
              nameTextForm: '${(snapshot.data as DocumentSnapshot)['username']}',
              tanggalLahirTextForm:
              '${(snapshot.data as DocumentSnapshot)['tanggallahir']}',
              jenisKelaminTextForm:
              '${(snapshot.data as DocumentSnapshot)['jeniskelamin']}',
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
