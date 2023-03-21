import 'package:alcohol_free/app/data/enums/journal_icon.dart';
import 'package:alcohol_free/app/data/models/alcohol.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Journal {
  DateTime date;
  JournalIcon icon;
  String description;

  late String jid;

  Journal(this.date, this.icon, this.description);

  factory Journal.fromJson(Map<String, dynamic> json) {
    // journal 종류 받기

    Journal journal = Journal(
      (json['date'] as Timestamp).toDate(),
      json['icon'] as JournalIcon,
      json['description'] as String,
    );

    return journal;
  }
}
