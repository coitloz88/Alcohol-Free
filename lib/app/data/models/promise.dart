import 'package:alcohol_free/app/data/enums/level_of_access.dart';
import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/models/requisite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Promise {
  String name;
  DateTime from, to;
  Requisite requisite;
  LevelOfAccess levelOfAccess;
  String memo;
  List<AlcoholFreeUser> friends;
  int count;

  late String pid;

  Promise(this.name, this.from, this.to, this.requisite, this.levelOfAccess,
      this.memo, this.friends, this.count);

  factory Promise.fromJson(Map<String, dynamic> json) {
    List<AlcoholFreeUser> friends = (json['friends'] as List<dynamic>)
        .map((e) => AlcoholFreeUser.fromJson(e as Map<String, dynamic>))
        .toList();

    Promise promise = Promise(
        json['name'] as String,
        (json['from'] as Timestamp).toDate(),
        (json['to'] as Timestamp).toDate(),
        Requisite.fromJson(json['requisite']),
        LevelOfAccess.fromIndex(json['levelOfAccess'] as int),
        json['memo'] as String,
        friends,
        json['count'] as int);

    return promise;
  }

  Map<String, dynamic> toJson() {
    var friendsJson = friends.map((e) => e.toJson());

    return <String, dynamic>{
      'name': name,
      'from': from,
      'to': to,
      'requisite': requisite.toJson(),
      'levelOfAccess': levelOfAccess.index,
      'memo': memo,
      'friends': friendsJson.toList(),
      'count': count,
    };
  }
}
