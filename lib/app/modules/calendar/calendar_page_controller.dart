import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:get/get.dart';

class CalendarPageController extends GetxController {
  static CalendarPageController get to => Get.find<CalendarPageController>();
  Journal? _journal;
  CalendarDateTime? _dateTime;

  Journal? get journal => _journal;

  CalendarDateTime? get dateTime => _dateTime;

  List<Journal> getJournalList() {
    return JournalService.to.journalList;
  }

  @override
  void onInit() {
    super.onInit();
    var now = DateTime.now();
    getJournal(
        CalendarDateTime(year: now.year, month: now.month, day: now.day));
    update();
  }

  void setDate(CalendarDateTime time) {
    _dateTime = time;
    update();
  }

  Journal? getJournal(CalendarDateTime time) {
    var check = 0;
    for (var journal in JournalService.to.journalList) {
      if (time.year == journal.date.year &&
          time.month == journal.date.month &&
          time.day == journal.date.day) {
        _journal = journal;
        check = 1;

        update();
        return journal;
      }
    }
    if (check == 0) {
      _journal = null;
    }
    update();
    return null;
  }
}
