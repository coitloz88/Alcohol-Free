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
}
