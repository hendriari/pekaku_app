// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:pekaku_app/screens/landing/auth_page/login_page.dart';
// import 'package:pekaku_app/services/firebase_services/firebase_auth_services.dart';
// import 'package:pekaku_app/services/firebase_services/firestore_services.dart';
// import 'package:pekaku_app/utils/colors.dart';
// import 'package:pekaku_app/utils/utils.dart';
// import 'package:provider/provider.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('penggunaBaru')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         if (snapshot.hasData) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child:
//                     Text('${(snapshot.data as DocumentSnapshot)['username']}'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//
//                   context.read<FirebaseAuthServices>().signOut();
//                 },
//                 child: Text('Logout'),
//               ),
//             ],
//           );
//         }
//         return Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Sorry an error occurred',
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Icon(
//                 FontAwesomeIcons.faceSadCry,
//                 color: MyColor.deepAqua,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/utils/colors.dart';
import 'package:pekaku_app/view_model/account_view_model/account_view_model.dart';
import 'package:pekaku_app/widgets/account_widget/account_profile_widget.dart';
import 'package:pekaku_app/widgets/account_widget/shimmer_profile_loading.dart';
import 'package:pekaku_app/widgets/widget/shimmer_widget.dart';
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
