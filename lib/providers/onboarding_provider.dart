import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  void prevPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }

  void toLast() {
    _currentPage = 2;
  }

  void resetPage() {
    _currentPage = 0;
    notifyListeners();
  }
}
