import 'package:alcohol_free/app/modules/calendar/local_widgets/add_button_wrapper.dart';
import 'package:alcohol_free/app/modules/calendar/local_widgets/month_calendar_view.dart';
import 'package:alcohol_free/app/modules/new_promise/local_widgets/journal_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'calendar_page_controller.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    Get.put(CalendarPageController());
  }

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: Column(children: [
          MonthCalendarView(),
          const SizedBox(height: 24),
          GetBuilder<CalendarPageController>(builder: (controller) {
            if (controller.journal == null) return AddButtonWrapper();
            return JournalWidget();
          })
        ])));
  }
}
