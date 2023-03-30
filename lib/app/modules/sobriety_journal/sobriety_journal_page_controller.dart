import 'package:alcohol_free/app/data/enums/mood_type.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SobrietyJournalPageController extends GetxController {
  MoodTypeWrapper moodTypeWrapper = MoodTypeWrapper();
  TextEditingController textEditingController = TextEditingController();

  @override
  late MoodType moodType;

  void onConfirm() {
    SobrietyJournal sobrietyJournal = SobrietyJournal(
        DateTime.now(), moodTypeWrapper.moodType, textEditingController.text);
    JournalService.to.createJournal(sobrietyJournal);
  }
}

class MoodTypeWrapper {
  late MoodType moodType;
}
