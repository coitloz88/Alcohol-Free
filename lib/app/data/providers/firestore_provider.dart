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
}
