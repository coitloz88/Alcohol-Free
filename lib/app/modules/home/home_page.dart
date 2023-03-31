import 'package:flutter/material.dart';
import 'local_widgets/profile_view.dart';
import 'local_widgets/week_calendar_view.dart';
import 'local_widgets/current_promise_view.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const ProfileView(),
            const SizedBox(height: 20),
            const WeekCalendarView(),
            const SizedBox(height: 30),
            CurrentPromiseView(),
          ]),
    ));
  }
}
