import 'package:flutter/material.dart';
import 'package:pekaku_app/src/utils/color.dart';
import 'package:pekaku_app/src/utils/custom_fonts.dart';
import 'package:pekaku_app/src/view_model/auth_view_model/auth_provider.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: paddingTop),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Disimpan',
                  style: CustomFonts.customHeaderText
                      .copyWith(color: MyColor.deepAqua),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthViewModel>().signOut();
                  },
                  child: Text('metu'))
            ],
          ),
        ),
      ),
    );
  }
}
