import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';
import 'package:alcohol_free/core/extentions/dateTime_days_between.dart';

class DayBased extends Requisite {
  DayBased(super.from, super.to);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'type':RequisiteType.dayBased.index,
    };
  }

  @override
  void updateCompletionStatus(List<Journal> journalWithinPeriod) {
    int promisePeriod = from.daysBetween(to);
    int drunkenDays = 0;

    for (Journal journal in journalWithinPeriod) {
      if(journal.runtimeType is DrinkingJournal) {
        ++drunkenDays;
      }
    }

    ratio = drunkenDays / promisePeriod;
    isCompleted = promisePeriod == drunkenDays ? true : false;
  }
}
