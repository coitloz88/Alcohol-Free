import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/consumption_based_requisite.dart';
import 'package:alcohol_free/app/data/models/day_based_requisite.dart';
import 'package:alcohol_free/app/data/models/journal.dart';

abstract class Requisite {
  String name;
  bool isCompleted = false;
  double ratio = 0.0;
  DateTime from, to;

  Requisite(this.name, this.from, this.to, this.ratio, this.isCompleted);

  factory Requisite.fromJson(json) {
    switch (RequisiteType.fromIndex(json['type'])) {
      case RequisiteType.consumptionBased:
        return ConsumptionBased.fromJson(json);
      case RequisiteType.dayBased:
        return DayBased.fromJson(json);
    }
  }

  Map<String, dynamic> toJson();
  void updateCompletionStatus(List<Journal> journalWithinPeriod);
}
