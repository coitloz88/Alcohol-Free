import 'package:alcohol_free/app/data/enums/journal_icon.dart';
import 'package:flutter/material.dart';

abstract class Journal {
  DateTime date;
  JournalIcon icon;
  String description;

  Journal(this.date, this.icon, this.description);
}
