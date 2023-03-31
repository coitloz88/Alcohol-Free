import 'dart:developer';

import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreProvider extends GetxService {
  static FirestoreProvider get to => Get.find<FirestoreProvider>();

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<DocumentReference> createPromise(json) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final CollectionReference promiseCollection =
        _userCollection.doc(uid).collection('promises');

    return promiseCollection.add(json);
  }

  Future<List<Map<String, dynamic>>> readPromiseList() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    CollectionReference promiseCollection =
        _userCollection.doc(uid).collection('promises');

    QuerySnapshot? snapshot = await promiseCollection.get();

    var promiseJsonList = snapshot.docs.map((promise) {
      var json = promise.data() as Map<String, dynamic>;
      json['pid'] = promise.id;
      return json;
    }).toList();

    return promiseJsonList;
  }

  Future<List<Map<String, dynamic>>> readFriendsPromiseList(String uid) async {
    CollectionReference promiseCollection =
    _userCollection.doc(uid).collection('promises');

    QuerySnapshot? snapshot = await promiseCollection.get();

    var promiseJsonList = snapshot.docs.map((promise) {
      var json = promise.data() as Map<String, dynamic>;
      json['pid'] = promise.id;
      return json;
    }).toList();

    return promiseJsonList;
  }


  Future<List<Map<String, dynamic>>> readJournalList() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    CollectionReference promiseCollection =
        _userCollection.doc(uid).collection('journals');

    QuerySnapshot? snapshot = await promiseCollection.get();

    var promiseJsonList = snapshot.docs.map((promise) {
      var json = promise.data() as Map<String, dynamic>;
      json['pid'] = promise.id;
      return json;
    }).toList();

    return promiseJsonList;
  }

  Future<DocumentReference> createJournal(json) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final CollectionReference journalCollection =
        _userCollection.doc(uid).collection('journals');

    return journalCollection.add(json);
  }

  Future<void> createUser(Map<String, dynamic> json) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return _userCollection.doc(uid).set(json);
  }

  Future<Map<String, dynamic>> readUser(String uid) async {
    DocumentSnapshot snapshot = await _userCollection.doc(uid).get();
    var json = snapshot.data() as Map<String, dynamic>?;
    if (json == null) throw Exception("user doesn't exist");
    json['uid'] = uid;

    return json;
  }

  Future<DocumentReference> createFriend(json) {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    final CollectionReference friendsCollection =
        _userCollection.doc(uid).collection('friends');

    return friendsCollection.add(json);
  }

  Future<List<Map<String, dynamic>>> readFriendList() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    log(uid);
    CollectionReference friendsCollection =
        _userCollection.doc(uid).collection('friends');

    QuerySnapshot? snapshot = await friendsCollection.get();

    var friendJsonList = snapshot.docs.map((friend) {
      var json = friend.data() as Map<String, dynamic>;
      return json;
    }).toList();
    return friendJsonList;
  }

  Future<List<String>> getFriendPList(uid) async {
    CollectionReference promiseCollection =
        _userCollection.doc(uid).collection('promises');

    QuerySnapshot? snapshot = await promiseCollection.get();

    var promiseJsonList = snapshot.docs.map((promise) => promise.id).toList();

    return promiseJsonList;
  }

  Future createSupport(uid, pid) async {
    final ref = _userCollection.doc(uid).collection("promises").doc(pid);
    ref.update({"support": FieldValue.increment(1)});

    // support 총 몇개인지 return 하고 싶어여
  }

  Future createEncourage(uid, pid) async {
    final ref = _userCollection.doc(uid).collection("promises").doc(pid);
    ref.update({"encourage": FieldValue.increment(1)});

    // encourage 총 몇개인지 return 하고 싶어여
  }

//QuerySnapshot? snapshot = await promiseCollection.get();

  Future<List<Map<String, dynamic>>> readUserList() async {
    CollectionReference userCollection = _userCollection;

    QuerySnapshot? snapshot = await userCollection.get();

    var userJsonList = snapshot.docs.map((user) {
      var json = user.data() as Map<String, dynamic>;
      json['uid'] = user.id;
      return json;
    }).toList();

    return userJsonList;
  }

  Future<int> getSumOfSupports() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    CollectionReference promiseCollection =
        _userCollection.doc(uid).collection('promises');

    QuerySnapshot? snapshot = await promiseCollection.get();
    int sum = 0;
    for (var element in snapshot.docs) {
      var json = element.data() as Map<String, dynamic>;
      int buffer = 0;
      if (json['support'] != null) {
        buffer = json['support'] as int;
      }
      sum += buffer;
    }
    return sum;
  }

  Future<List<Promise>> getFriendsSharedPromise(String fid) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    // 친구의 해당 promise
    CollectionReference promiseCollection =
        _userCollection.doc(fid).collection('promises');

    List<Promise> promiseList = [];
    QuerySnapshot? snapshot = await promiseCollection.get();

    for (var promise in snapshot.docs) {
      var json = promise.data() as Map<String, dynamic>;
      json['pid'] = promise.id;
      print(fid);
      print(json['friends']);
      List<AlcoholFreeUserFriend> friendList = (json['friends']
              as List<dynamic>)
          .map((e) => AlcoholFreeUserFriend.fromJson(e as Map<String, dynamic>))
          .toList();

      friendList.where((friend) => friend.uid == uid).toList();
      if (friendList.isNotEmpty) {
        promiseList.add(Promise.fromJson(json));
      }
    }
    return promiseList;
  }
}
