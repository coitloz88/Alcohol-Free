import 'dart:developer';

import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromiseRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;
  final FirebaseAuthProvider _authProvider = FirebaseAuthProvider.to;

  Future<String> createPromise(Promise promise) async {
    DocumentReference promiseDocRef =
        await _dbProvider.createPromise(promise.toJson());
    return promiseDocRef.id;
  }

  Future<List<Promise>> readPromiseList() async {
    List<Map<String, dynamic>> promiseJsonList =
        await _dbProvider.readPromiseList();
    List<Promise> promiseList = promiseJsonList
        .map((promiseJson) => Promise.fromJson(promiseJson))
        .toList();

    return promiseList;
  }

  bool isLoggedIn() {
    return _authProvider.isLoggedIn();
  }

  Future<int> getSumOfSupports() async {
    var sum = await _dbProvider.getSumOfSupports();
    return sum;
  }

  Future getFriendsPromiseList() async {
    List<Map<String, dynamic>> friendJsonList =
        await _dbProvider.readFriendList();

    List<Promise>? promiseList = [];
    for (var friendJson in friendJsonList) {
      promiseList =
          await _dbProvider.getFriendsSharedPromise(friendJson['uid']);
    }
    return promiseList;
  }
}
