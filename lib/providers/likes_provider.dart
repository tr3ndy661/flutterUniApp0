import 'package:flutter/foundation.dart';

class LikesProvider with ChangeNotifier {
  int _likesCount = 0;

  int get likesCount => _likesCount;

  void incrementLikes() {
    _likesCount++;
    notifyListeners();
  }

  void decrementLikes() {
    if (_likesCount > 0) {
      _likesCount--;
      notifyListeners();
    }
  }
}
