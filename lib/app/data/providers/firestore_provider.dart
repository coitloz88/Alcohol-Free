import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
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

    CollectionReference friendsCollection =
        _userCollection.doc(uid).collection('friends');

    QuerySnapshot? snapshot = await friendsCollection.get();

    var friendJsonList = snapshot.docs.map((friend) {
      var json = friend.data() as Map<String, dynamic>;
      json['uid'] = friend.id;
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
  }

  Future createEncourage(uid, pid) async {
    final ref = _userCollection.doc(uid).collection("promises").doc(pid);
    ref.update({"encourage": FieldValue.increment(1)});
  }

//QuerySnapshot? snapshot = await promiseCollection.get();
}
