import 'package:alcohol_free/app/data/enums/requisite_type.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';

class ConsumptionBased implements Requisite {
  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'type':RequisiteType.consumptionBased.index,
    };
  }
  // int consumption;
}