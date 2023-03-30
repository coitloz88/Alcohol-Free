import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkingJournalPageController extends GetxController {
  int _numberOfPerson = 1;
  final List<bool> _selectedDrinkState = <bool>[false, false, false];
  int _numberOfAlcohol = 1;
  MoodTypeWrapper moodTypeWrapper = MoodTypeWrapper();
  TextEditingController textEditingController = TextEditingController();

  int get numberOfPerson => _numberOfPerson;
  List<bool> get selectedDrinkState => _selectedDrinkState;
  int get numberOfAlcohol => _numberOfAlcohol;

  void updateNumberOfPerson(int newNumber) {
    _numberOfPerson = newNumber;
    update();
  }

  void updateNumberOfAlcohol(int newNumber) {
    _numberOfAlcohol = newNumber;
    update();
  }

  void updateSelectedDrinkState(int index) {
    for (int i = 0; i < _selectedDrinkState.length; i++) {
      _selectedDrinkState[i] = i == index;
    }
  }
}
