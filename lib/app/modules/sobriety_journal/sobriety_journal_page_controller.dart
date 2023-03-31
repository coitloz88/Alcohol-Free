import 'package:alcohol_free/app/data/enums/mood_type.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/modules/calendar/calendar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SobrietyJournalPageController extends GetxController {
  static SobrietyJournalPageController get to =>
      Get.find<SobrietyJournalPageController>();
  MoodTypeWrapper moodTypeWrapper = MoodTypeWrapper();
  TextEditingController textEditingController = TextEditingController();

  @override
  late MoodType moodType;

  void onConfirm() {
    var date = CalendarPageController.to.dateTime;
    SobrietyJournal sobrietyJournal = SobrietyJournal(
        DateTime(
          date!.year,
          date!.month,
          date!.day,
        ),
        moodTypeWrapper.moodType,
        textEditingController.text);
    JournalService.to.createJournal(sobrietyJournal);
  }
}

class MoodTypeWrapper {
  late MoodType moodType;
}
