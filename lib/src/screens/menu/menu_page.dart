import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pekaku_app/src/utils/colors.dart';
import 'package:pekaku_app/src/view_model/menu_view_model/menu_provider.dart';
import 'package:pekaku_app/src/view_model/user_view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuViewModel>(builder: (context, value, child) {
      return WillPopScope(
        onWillPop: () async {
          return value.onWillPop(context);
        },
        child: Scaffold(
          extendBody: true,
          body: value.pages,
          bottomNavigationBar: _bottomNavBar(context),
        ),
      );
    });
  }

  Container _bottomNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
      height: 62,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColor.deepAqua,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Consumer<MenuViewModel>(builder: (context, value, index) {
        return BottomNavigationBar(
          backgroundColor: MyColor.transparan,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColor.marble,
          unselectedItemColor: MyColor.lichen,
          selectedIconTheme: const IconThemeData(size: 32),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            value.onTappeed = index;
          },
          currentIndex: value.currentPage,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.leaf),
              label: 'Feeds',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.creativeCommonsSampling),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.feather),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.signature),
              label: 'Account',
            ),
          ],
        );
      }),
    );
  }
}
