import 'package:flutter/cupertino.dart';
import 'package:pekaku_app/src/screens/menu/account/account_page.dart';
import 'package:pekaku_app/src/screens/menu/create_post/create_post_page.dart';
import 'package:pekaku_app/src/screens/menu/history/history_page.dart';
import 'package:pekaku_app/src/screens/menu/home/home_page.dart';
import 'package:pekaku_app/src/widgets/dialog/exit_dialog.dart';


class MenuViewModel with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  final List<Widget> _pages = [
    const HomePage(),
    const CreatePostPage(),
    const HistoryPage(),
    const AccountPage(),
  ];

  get pages => _pages[_currentPage];

  set onTappeed(int index) {
    _currentPage = index;
    notifyListeners();
  }

  Future<bool> onWillPop(BuildContext context) async {
    if (_currentPage > 0) {
      _currentPage = 0;
      return Future(() => false);
    } else {
      bool exit = await showExitDialog(context) ?? false;
      if (exit) {
        exit = true;
        notifyListeners();
      }
      return Future(() => exit);
    }
  }
}
