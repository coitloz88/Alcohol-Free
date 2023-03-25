import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;

  // 친구 만들기
  Future<String> createFriend(AlcoholFreeUser friend) async {
    DocumentReference friendDocRef =
        await _dbProvider.createFriend(friend.toJson());
    return friendDocRef.id;
  }

  // 내 친구 목록 가져오기
  Future<List<AlcoholFreeUser>> readFriendList() async {
    List<Map<String, dynamic>> friendJsonList =
        await _dbProvider.readFriendList();
    List<AlcoholFreeUser> friendList = friendJsonList
        .map((friendJson) => AlcoholFreeUser.fromJson(friendJson))
        .toList();

    return friendList;
  }

  // 응원하기
  Future<String> createFighting(AlcoholFreeUser friend) async {
    DocumentReference friendDocRef =
        await _dbProvider.createFriend(friend.toJson());
    return friendDocRef.id;
  }

  // 격려 하기
  Future<String> createEncourage(AlcoholFreeUser friend) async {
    DocumentReference friendDocRef =
        await _dbProvider.createFriend(friend.toJson());
    return friendDocRef.id;
  }

  // 목표 제안하기
  Future<String> createGoal(AlcoholFreeUser friend) async {
    DocumentReference friendDocRef =
        await _dbProvider.createFriend(friend.toJson());
    return friendDocRef.id;
  }

// 응원, 격려, 목표 제안 기능 추가
}
