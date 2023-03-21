import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/journal_icon.dart';

class SobrietyJournal extends Journal {
  SobrietyJournal(super.date, super.icon, super.description);

  factory SobrietyJournal.fromJson(Map<String, dynamic> json) {
    // journal 종류 받기

    SobrietyJournal journal = SobrietyJournal(
      (json['date'] as Timestamp).toDate(),
      json['icon'] as JournalIcon,
      json['description'] as String,
    );

    return journal;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'icon': icon,
      'description': description,
    };
  }
}
