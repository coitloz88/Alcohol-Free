import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

class MonthCalendarView extends StatelessWidget {
  const MonthCalendarView({super.key});

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
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.SHORT),
    );
  }
}
