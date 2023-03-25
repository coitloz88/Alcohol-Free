import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';

class ConsumptionBased extends Requisite {
  int targetAlcoholConsumption;
  ConsumptionBased(super.from, super.to, this.targetAlcoholConsumption);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': RequisiteType.consumptionBased.index,
      'targetAlcoholConsumption': targetAlcoholConsumption,
    };
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
    isCompleted = ratio > 1 ? false : true;
  }
}
