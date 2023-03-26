import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';
import 'package:alcohol_free/core/extentions/dateTime_days_between.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DayBased extends Requisite {
  DayBased(super.from, super.to, super.ratio, super.isCompleted);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': RequisiteType.dayBased.index,
      'from': from,
      'to': to,
      'ratio': ratio,
      'isCompleted': isCompleted,
    };
  }

  factory DayBased.fromJson(Map<String, dynamic> json) {
    DayBased dayBased = DayBased(
      (json['from'] as Timestamp).toDate(),
      (json['to'] as Timestamp).toDate(),
      json['ratio'] as double,
      json['isCompleted'] as bool,
    );
    return dayBased;
  }

  @override
  void updateCompletionStatus(List<Journal> journalWithinPeriod) {
    DateTime supremum = DateTime.now().compareTo(to) < 0 ? DateTime.now() : to;
    int notDrunkenDays = from.daysBetween(supremum);
    int totalDays = from.daysBetween(to);

    for (Journal journal in journalWithinPeriod) {
      if (journal.runtimeType is DrinkingJournal) {
        --notDrunkenDays;
      }
    }

    ratio = notDrunkenDays / (totalDays);
    isCompleted = notDrunkenDays == totalDays ? true : false;
  }
}
