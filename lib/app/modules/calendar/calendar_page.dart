import 'package:alcohol_free/app/modules/calendar/local_widgets/add_button_wrapper.dart';
import 'package:alcohol_free/app/modules/calendar/local_widgets/month_calendar_view.dart';
import 'package:flutter/widgets.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(
          children: [
            MonthCalendarView(),
            const SizedBox(height: 24),
            AddButtonWrapper()
          ],
        )));
  }
}
