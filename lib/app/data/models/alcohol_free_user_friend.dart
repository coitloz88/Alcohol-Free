import 'package:alcohol_free/app/data/services/friends_service/friends_repository.dart';

class AlcoholFreeUserFriend {
  String uid;
  String nickname;
  List<String> pidList;

  AlcoholFreeUserFriend(this.uid, this.nickname, this.pidList);

  final FriendsRepository _friendsRepository = FriendsRepository();

  factory AlcoholFreeUserFriend.fromJson(Map<String, dynamic> json) {
    return AlcoholFreeUserFriend(json['uid'] as String,
        json['nickname'] as String, json['pidList'] as List<String>);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nickname': nickname,
      'pidList': pidList.toList(),
    };
  }
}
