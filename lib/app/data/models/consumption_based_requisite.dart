import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConsumptionBased extends Requisite {
  int targetAlcoholConsumption;

  ConsumptionBased(super.name, super.from, super.to, super.ratio,
      super.isCompleted, this.targetAlcoholConsumption);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': RequisiteType.consumptionBased.index,
      'targetAlcoholConsumption': targetAlcoholConsumption,
      'from': from,
      'to': to,
      'ratio': ratio,
      'isCompleted': isCompleted,
    };
  }

  factory ConsumptionBased.fromJson(Map<String, dynamic> json) {
    ConsumptionBased consumptionBased = ConsumptionBased(
        "절주",
        (json['from'] as Timestamp).toDate(),
        (json['to'] as Timestamp).toDate(),
        json['ratio'] as double,
        json['isCompleted'] as bool,
        json['targetAlcoholConsumption'] as int);
    return consumptionBased;
  }

  @override
  void updateCompletionStatus(List<Journal> journalWithinPeriod) {
    int totalAlcoholConsumption = 0;

    for (Journal journal in journalWithinPeriod) {
      if (journal.runtimeType is DrinkingJournal) {
        totalAlcoholConsumption += (journal as DrinkingJournal).howMany ?? 0;
      }
    }

    ratio = totalAlcoholConsumption / targetAlcoholConsumption;
    ratio = ratio < 0 ? 0 : ratio;

    isCompleted = ratio > 1 ? false : true;
  }
}
