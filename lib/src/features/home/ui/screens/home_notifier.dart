import 'package:flutter/foundation.dart';

class HomeNotifier with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
