import 'dart:convert';

import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendsRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;
  final FirebaseAuthProvider _authProvider = FirebaseAuthProvider.to;

  bool isLoggedIn() {
    return _authProvider.isLoggedIn();
  }

  // 친구 만들기
  Future<String> createFriend(AlcoholFreeUser user, List<String> plist) async {
    AlcoholFreeUserFriend friend =
        AlcoholFreeUserFriend(user.uid, user.nickname, plist);
    DocumentReference friendDocRef =
        await _dbProvider.createFriend(friend.toJson());
    return friendDocRef.id;
  }

  // 내 친구 목록 가져
  Future<List<AlcoholFreeUserFriend>> readFriendList() async {
    List<Map<String, dynamic>> friendJsonList =
        await _dbProvider.readFriendList();
    List<AlcoholFreeUserFriend> friendList = friendJsonList
        .map((friendJson) => AlcoholFreeUserFriend.fromJson(friendJson))
        .toList();

    return friendList;
  }

  Future<AlcoholFreeUserFriend> getUser(String uid) async {
    return AlcoholFreeUserFriend.fromJson(await _dbProvider.readUser(uid));
  }

  // promise list 받기
  Future<List<String>> getPList(String uid) async {
    List<String> promiseList = await _dbProvider.getFriendPList(uid);
    return promiseList;
  }

  Future createSupport(String uid, String pid) async {
    var support = await _dbProvider.createSupport(uid, pid);
    return support;
  }

  Future createEncourage(String uid, String pid) async {
    var encourage = await _dbProvider.createEncourage(uid, pid);
    return encourage;
  }

  Future<List<Promise>> readFriendPromiseList(String uid) async {
    List<Map<String, dynamic>> promiseJsonList =
    await _dbProvider.readFriendsPromiseList(uid);
    List<Promise> promiseList = promiseJsonList
        .map((promiseJson) {
          return Promise.fromJson(promiseJson)
              ..pid = promiseJson['pid'] as String;
        })
        .toList();

    return promiseList;
  }


/*
  Future suggestPromise(String uid, Promise promise) async {
    var promise = await _dbProvider.suggestPromise(uid, promise);
    return promise;
  }
*/
// 응원, 격려, 목표 제안 기능 추가
}
