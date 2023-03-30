enum LevelOfAccess {
  public("공개"),
  private("비공개");

  const LevelOfAccess(this.name);
  final String name;

  factory LevelOfAccess.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }
}
