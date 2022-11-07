import 'package:flutter/material.dart';
import 'package:pekaku_app/src/widget/widget/text_header.dart';

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
                child: textHeader('Disi','mpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
