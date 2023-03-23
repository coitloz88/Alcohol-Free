import 'package:alcohol_free/app/data/enums/journal_icon.dart';
import 'package:alcohol_free/app/data/enums/journal_type.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';

import 'drinking_journal.dart';

abstract class Journal {
  DateTime date;
  JournalIcon icon;
  String description;

  late String jid;

  Journal(this.date, this.icon, this.description);

  // 만들 때
  Map<String, dynamic> toJson();

  // 가져올 때
  factory Journal.fromJson(Map<String, dynamic> json) {
    switch (JournalType.fromIndex(json['type'])) {
      case JournalType.drinkingJournal:
        return DrinkingJournal.fromJson(json);
      case JournalType.sobrietyJournal:
        return SobrietyJournal.fromJson(json);
    }
  }
}
