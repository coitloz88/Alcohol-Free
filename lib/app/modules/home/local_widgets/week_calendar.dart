import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

class WeekCalendarView extends StatelessWidget {
  const WeekCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        WeekCalendarContainer(),
      ],
    );
  }
}

class WeekCalendarContainer extends StatelessWidget {
  const WeekCalendarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        toggleViewType: false,
      ),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.SHORT),
    );
  }
}

class WeekProgressContainer extends StatelessWidget {
  final int currentWeekAlcohol;

  const WeekProgressContainer({Key? key, required this.currentWeekAlcohol})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '이번주는 총 $currentWeekAlcohol회 마셨습니다. 잘하고 있어요!',
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
