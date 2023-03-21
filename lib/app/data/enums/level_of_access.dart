enum LevelOfAccess {
  public,
  private;

  factory LevelOfAccess.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }
}