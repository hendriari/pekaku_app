import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pekaku_app/src/view_model/account_view_model/account_provider.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accounProvider = Provider.of<AccountViewModel>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

        StreamBuilder<QuerySnapshot>(
        stream: accounProvider.usersFirestore,
            builder: (_, snapshot){
              if(snapshot.hasData){
                return Column(
                  children: snapshot.data!.docs.map((e){
                    Map<String, dynamic> data = e.data()! as Map<String, dynamic>;
                    return Column(
                      children: [
                        Text(data['name']),
                        Text(data['alamat']),
                        Text(data['kelamin']),
                        Text(data['tanggallahir']),
                        Text(data['kelamin']),
                      ],
                    );
                  }).toList().cast(),

                );
              }
              else {
                return Text('Error Get Data');
              }
              // return Text('Error Get Data');

            }),

            
            Consumer<AuthViewModel>(builder: (context, value, child) {
              return Text(value.currentUser?.email ?? 'User email');
            }),
            

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
