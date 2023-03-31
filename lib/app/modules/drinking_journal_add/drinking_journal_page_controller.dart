import 'package:alcohol_free/app/data/enums/level_of_being_drunk.dart';
import 'package:alcohol_free/app/data/models/alcohol.dart';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/modules/calendar/calendar_page_controller.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkingJournalPageController extends GetxController {
  static DrinkingJournalPageController get to =>
      Get.find<DrinkingJournalPageController>();

  // 기분
  MoodTypeWrapper moodTypeWrapper = MoodTypeWrapper();

  // why
  String _why = "분위기";

  // 누구랑
  String _who = "친구";
  int _numberOfPerson = 1;

  int get numberOfPerson => _numberOfPerson;

  // 언제
  String? _from;
  String? _to;

  // 취함의 정도
  final List<bool> _selectedDrinkState = <bool>[false, false, false];

  List<bool> get selectedDrinkState => _selectedDrinkState;

  // 술 종류
  String _alcoholName = "맥주";
  int _numberOfAlcohol = 1;
  final List<bool> _alcoholUnit = <bool>[false, false];

  int get numberOfAlcohol => _numberOfAlcohol;

  List<bool> get alcoholUnit => _alcoholUnit;

  // 비용과 메모
  TextEditingController expenseEditingController = TextEditingController();
  TextEditingController memoEditingController = TextEditingController();

  void updateWhy(String why) {
    _why = why;
    update();
  }

  void updateWho(String who) {
    _who = who;
    update();
  }

  void updateNumberOfPerson(int newNumber) {
    _numberOfPerson = newNumber;
    update();
  }

  void updateFrom(String from) {
    print(from);
    _from = from;
    update();
  }

  void updateTo(String to) {
    print(to);
    _to = to;
    update();
  }

  void updateSelectedDrinkState(int index) {
    for (int i = 0; i < _selectedDrinkState.length; i++) {
      _selectedDrinkState[i] = i == index;
    }
    update();
  }

  void updateAlcoholName(String name) {
    _alcoholName = name;
    update();
  }

  void updateNumberOfAlcohol(int newNumber) {
    _numberOfAlcohol = newNumber;
    update();
  }

  void updateSelectedAlcoholUnit(int index) {
    for (int i = 0; i < _alcoholUnit.length; i++) {
      _alcoholUnit[i] = i == index;
    }
    update();
  }

  void onConfirm() {
    var date = CalendarPageController.to.dateTime;
    var friendList = List.generate(_numberOfPerson, (index) => _who);
    var selectedIndex;
    var alcoholIndex;
    for (int i = 0; i < _selectedDrinkState.length; i++) {
      if (_selectedDrinkState[i]) {
        selectedIndex = i;
      }
    }
    for (int i = 0; i < _alcoholUnit.length; i++) {
      if (_alcoholUnit[i]) {
        alcoholIndex = i;
      }
    }
    DrinkingJournal journal = DrinkingJournal(
        DateTime(
          date!.year,
          date.month,
          date.day,
        ),
        moodTypeWrapper.moodType,
        memoEditingController.text,
        _why,
        "",
        friendList,
        LevelOfBeingDrunk.fromIndex(selectedIndex),
        DateTime(date.year, date.month, date.day, int.parse(_from!)),
        DateTime(date.year, date.month, date.day, int.parse(_to!)),
        Alcohol(_alcoholName, alcoholIndex == 0 ? "병" : "잔"),
        _numberOfAlcohol,
        memoEditingController.text,
        int.parse(expenseEditingController.text));

    JournalService.to.createJournal(journal);
  }
}
