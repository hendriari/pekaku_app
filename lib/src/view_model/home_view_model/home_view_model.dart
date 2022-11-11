import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  bool _isLikeAnimating = false;

  get isLikeAnimating => _isLikeAnimating;

  void likesAnimating() {
    _isLikeAnimating = !_isLikeAnimating;
    notifyListeners();
  }

  void endLikesAnimating() {
    _isLikeAnimating = false;
    notifyListeners();
  }
}
