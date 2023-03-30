import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:get/get.dart';

class UserRepository {
  static UserRepository get to => Get.find<UserRepository>();

  final FirestoreProvider _dbProvider = FirestoreProvider.to;
  final FirebaseAuthProvider _authProvider = FirebaseAuthProvider.to;

  bool isLoggedIn() {
    return _authProvider.isLoggedIn();
  }

  Future<AlcoholFreeUser> readUser() async {
    return AlcoholFreeUser.fromJson(
        await _dbProvider.readUser(_authProvider.getUid()!));
  }

  Future<List<AlcoholFreeUser>> readUserList() async {
    List<Map<String, dynamic>> userJsonList = await _dbProvider.readUserList();

    List<AlcoholFreeUser> userList = userJsonList
        .map((userJson) => AlcoholFreeUser.fromJson(userJson))
        .toList();
    return userList;
  }

  // promise list 받기
  Future<List<String>> getPList(String uid) async {
    List<String> promiseList = await _dbProvider.getFriendPList(uid);
    return promiseList;
  }
}
