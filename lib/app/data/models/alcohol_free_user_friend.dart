import 'dart:developer';

import 'package:alcohol_free/app/data/services/friends_service/friends_repository.dart';
import 'package:get/get.dart';

class AlcoholFreeUserFriend {
  String uid;
  String? nickname;
  List<String> pidList;

  AlcoholFreeUserFriend(this.uid, this.nickname, this.pidList);

  final FriendsRepository _friendsRepository = FriendsRepository();

  factory AlcoholFreeUserFriend.fromJson(Map<String, dynamic> json) {
    List<String> pidList =
        (json['pidList'] as List<dynamic>).map((e) => e.toString()).toList();

    return AlcoholFreeUserFriend(
        json['uid'] as String, json['nickname'] as String, pidList);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'nickname': nickname,
      'pidList': pidList.toList(),
    };
  }
}
