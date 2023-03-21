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

  // Future<List<Map<String, dynamic>>> readPromiseList() {
  //
  // }
}
