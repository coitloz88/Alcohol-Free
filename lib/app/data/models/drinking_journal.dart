import 'package:alcohol_free/app/data/enums/journal_icon.dart';
import 'package:alcohol_free/app/data/enums/level_of_being_drunk.dart';
import 'package:alcohol_free/app/data/models/alcohol.dart';
import 'package:alcohol_free/app/data/models/journal.dart';

class DrinkingJournal extends Journal {
  String? why;
  String? where;
  List<String>? friends; // 프리셋 제공
  LevelOfBeingDrunk? levelOfBeingDrunk;
  DateTime? from, to;
  Alcohol? alcohol;
  int? howmany;
  String? hangoverMemo;

  // uint expense
  //Unit bottle/glass

  DrinkingJournal(
    super.date,
    super.icon,
    super.description,
    this.why,
    this.where,
    this.friends,
    this.levelOfBeingDrunk,
    this.from,
    this.to,
    this.alcohol,
    this.hangoverMemo,
  );
}
