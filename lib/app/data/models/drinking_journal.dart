import 'package:alcohol_free/app/data/enums/journal_icon.dart';
import 'package:alcohol_free/app/data/enums/level_of_being_drunk.dart';
import 'package:alcohol_free/app/data/models/alcohol.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  // expense와 bottle/glass 그리고 alcohol은 아직!!

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

  factory DrinkingJournal.fromJson(Map<String, dynamic> json) {
    // journal 종류 받기

    DrinkingJournal journal = DrinkingJournal(
      (json['date'] as Timestamp).toDate(),
      json['icon'] as JournalIcon,
      json['description'] as String,
      json['why'] as String,
      json['where'] as String,
      json['friends'] as List<String>,
      LevelOfBeingDrunk.fromIndex(json['levelOfBeingDrunk'] as int),
      (json['from'] as Timestamp).toDate(),
      (json['to'] as Timestamp).toDate(),
      json['alcohol'] as Alcohol,
      json['hangoverMemo'] as String,
    );

    return journal;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'icon': icon,
      'description': description,
      'why': why,
      'where': where,
      'friends': friends?.toList(),
      'levelOfBeingDrunk': levelOfBeingDrunk?.index,
      'from': from,
      'to': to,
      'alcohol': alcohol,
      'hangoverMemo': hangoverMemo
    };
  }
}
