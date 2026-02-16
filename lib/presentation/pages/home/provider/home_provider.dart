import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/home/provider/home_state.dart';

class HomeProvider extends ChangeNotifier {
  HomeState _state = HomeState.initial();
  HomeState get state => _state;

  void changeIndex(int index) {
    _state = _state.copyWith(currentIndex: index);
    notifyListeners();
  }
}
