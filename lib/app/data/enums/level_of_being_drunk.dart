enum LevelOfBeingDrunk {
  sober,
  tipsy,
  drunken;

  factory LevelOfBeingDrunk.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }

  String toKorean() {
    switch (this) {
      case LevelOfBeingDrunk.sober:
        return "전혀 취하지 않았어요";
      case LevelOfBeingDrunk.tipsy:
        return "적당히 취했어요";
      case LevelOfBeingDrunk.drunken:
        return "만취했어요";
      default:
        return "";
    }
  }
}
