import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/modules/calendar/calendar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:get/get.dart';

class MonthCalendarView extends StatefulWidget {
  const MonthCalendarView({super.key});

  @override
  State<MonthCalendarView> createState() => _MonthCalendarViewState();
}

class _MonthCalendarViewState extends State<MonthCalendarView> {
  @override
  void initState() {
    super.initState();
    CalendarPageController.to.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xFFFFEED5))),
        child: MonthCalendarContainer());
  }
}

class MonthCalendarContainer extends StatelessWidget {
  const MonthCalendarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      onChangeDateTime: (dateTime) {
        CalendarPageController.to.getJournal(dateTime);
        CalendarPageController.to.setDate(dateTime);
      },
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.SHORT),
    );
  }
}
