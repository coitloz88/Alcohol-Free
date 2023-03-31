import 'dart:developer';

import 'package:alcohol_free/app/data/enums/mood_type.dart';
import 'package:alcohol_free/app/data/enums/journal_type.dart';
import 'package:alcohol_free/app/data/enums/level_of_being_drunk.dart';
import 'package:alcohol_free/app/data/models/alcohol.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DrinkingJournal implements Journal {
  @override
  DateTime date;
  @override
  String description;
  @override
  MoodType icon;
  @override
  late String jid;

  String? why;
  String? where;
  List<String>? friends; // 프리셋 제공
  LevelOfBeingDrunk? levelOfBeingDrunk;
  DateTime? from, to;
  Alcohol? alcohol;
  int? howMany;
  String? hangoverMemo;
  int? expense;

  // uint expense
  //Unit bottle/glass

  // expense와 bottle/glass 그리고 alcohol은 아직!!

  DrinkingJournal(
      this.date,
      this.icon,
      this.description,
      this.why,
      this.where,
      this.friends,
      this.levelOfBeingDrunk,
      this.from,
      this.to,
      this.alcohol,
      this.howMany,
      this.hangoverMemo,
      this.expense);

  factory DrinkingJournal.fromJson(Map<String, dynamic> json) {
    // journal 종류 받기
    List<String>? friends = json['friends'] != null
        ? (json['friends'] as List<dynamic>).map((e) => e.toString()).toList()
        : [];

    DrinkingJournal journal = DrinkingJournal(
      (json['date'] as Timestamp).toDate(),
      MoodType.fromPath(json['icon']),
      json['description'] as String,
      json['why'] as String,
      json['where'] as String,
      friends,
      LevelOfBeingDrunk.fromIndex(json['levelOfBeingDrunk'] as int),
      (json['from'] as Timestamp).toDate(),
      (json['to'] as Timestamp).toDate(),
      Alcohol.fromJson(json['alcohol']),
      json['howMany'] as int,
      json['hangoverMemo'] as String,
      json['expense'] as int,
    );

    return journal;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'icon': icon.toJson(),
      'description': description,
      'why': why,
      'where': where,
      'friends': friends?.toList(),
      'levelOfBeingDrunk': levelOfBeingDrunk?.index,
      'from': from,
      'to': to,
      'howMany': howMany,
      'alcohol': alcohol?.toJson(),
      'hangoverMemo': hangoverMemo,
      'expense': expense,
      'type': JournalType.drinkingJournal.index,
    };
  }
}
