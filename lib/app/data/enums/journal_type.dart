enum JournalType {
  sobrietyJournal,
  drinkingJournal;

  factory JournalType.fromIndex(int idx) {
    return values.firstWhere((element) => element.index == idx);
  }
}
