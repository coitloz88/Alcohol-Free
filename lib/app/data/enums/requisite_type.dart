enum RequisiteType {
  consumptionBased,
  dayBased;

  factory RequisiteType.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }
}