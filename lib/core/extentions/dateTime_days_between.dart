extension DaysBetween on DateTime {
  int daysBetween(DateTime to) {
    DateTime from = DateTime(year, month, day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}