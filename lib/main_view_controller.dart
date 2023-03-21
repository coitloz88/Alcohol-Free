import 'package:get/get.dart';

class MainViewController extends GetxController {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateBottomTabToTapped(int index) {
    _selectedIndex = index;
    update();
  }
}
