import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/consumption_based_requisite.dart';
import 'package:alcohol_free/app/data/models/day_based_requisite.dart';

abstract class Requisite {
  factory Requisite.fromJson(json) {
    switch(json['type'] as RequisiteType) {
      case RequisiteType.consumptionBased:
        return ConsumptionBased();
      case RequisiteType.dayBased:
        return DayBased();
    }
  }

  Map<String, dynamic> toJson();
}