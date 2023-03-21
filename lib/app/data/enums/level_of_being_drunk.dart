enum LevelOfBeingDrunk {
  sober,
  tipsy,
  drunken;

  factory LevelOfBeingDrunk.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }
}
