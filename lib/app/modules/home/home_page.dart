import 'package:flutter/material.dart';
import 'package:alcohol_free/app/modules/home/local_widgets/profile.dart';
import 'package:alcohol_free/app/modules/home/local_widgets/week_calendar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [ProfileView(), WeekCalendarView()]);
  }
}
