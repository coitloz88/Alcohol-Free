import 'package:alcohol_free/app/data/enums/journal_type.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/mood_type.dart';

class SobrietyJournal implements Journal {
  @override
  DateTime date;
  @override
  String description;
  @override
  MoodType icon;
  @override
  late String jid;

  SobrietyJournal(this.date, this.icon, this.description);

  factory SobrietyJournal.fromJson(Map<String, dynamic> json) {
    // journal 종류 받기

    SobrietyJournal journal = SobrietyJournal(
      (json['date'] as Timestamp).toDate(),
      MoodType.fromPath(json['icon']),
      json['description'] as String,
    );

    return journal;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'icon': icon.toString(),
      'description': description,
      'type': JournalType.sobrietyJournal.index,
    };
  }
}
