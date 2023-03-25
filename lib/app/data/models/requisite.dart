import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/consumption_based_requisite.dart';
import 'package:alcohol_free/app/data/models/day_based_requisite.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Requisite {
  bool isCompleted = false;
  double ratio = 0.0;
  DateTime from, to;

  Requisite(this.from, this.to);

  factory Requisite.fromJson(json) {
    switch (RequisiteType.fromIndex(json['type'])) {
      case RequisiteType.consumptionBased:
        return ConsumptionBased(
          (json['from'] as Timestamp).toDate(),
          (json['to'] as Timestamp).toDate(),
          json['targetAlcoholConsumption'] as int,
        );
      case RequisiteType.dayBased:
        return DayBased(
          (json['from'] as Timestamp).toDate(),
          (json['to'] as Timestamp).toDate(),
        );
    }
  }

  Map<String, dynamic> toJson();
  void updateCompletionStatus(List<Journal> journalWithinPeriod);
}
