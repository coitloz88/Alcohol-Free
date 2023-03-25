import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

class WeekCalendarView extends StatelessWidget {
  const WeekCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color(0xFFFFEED5))),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 17, 24, 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              WeekCalendarContainer(),
              SizedBox(height: 32),
              WeekProgressContainer(
                currentWeekAlcohol: 0,
                heart: 0,
              )
            ],
          ),
        ));
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
  final int heart;

  const WeekProgressContainer(
      {Key? key, required this.currentWeekAlcohol, required this.heart})
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$heart '),
            Icon(
              CupertinoIcons.heart_fill,
              size: 20,
              color: Color(0xFFFFAC30),
            )
          ],
        )
      ],
    );
  }
}
