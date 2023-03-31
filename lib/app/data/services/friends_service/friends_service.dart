import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/friends_service/friends_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FriendsService extends GetxService {
  static FriendsService get to => Get.find<FriendsService>();
  final FriendsRepository _friendsRepository = FriendsRepository();

  List<AlcoholFreeUserFriend> _friendList = [];

  List<AlcoholFreeUserFriend> get friendList => _friendList;

  // 프렌즈 pid list, uid,
  // 프렌즈 초기화

  Future<FriendsService> init() async {
    if (_friendsRepository.isLoggedIn()) {
      _friendList = await _friendsRepository.readFriendList();
    }
    return this;
  }

  Future<String?> createFriend(AlcoholFreeUser friend) async {
    if (FirebaseAuth.instance.currentUser!.uid != friend.uid) {
      var plist = await getPList(friend.uid);
      String fid = await _friendsRepository.createFriend(friend, plist);
      return fid;
    }
    return null;
  }

  // pList 받기
  Future<List<String>> getPList(String uid) async {
    List<String> promiseList = await _friendsRepository.getPList(uid);
    return promiseList;
  }

  Future<List<Promise>> readPromiseList(String uid) async {
    return await _friendsRepository.readFriendPromiseList(uid);
  }

  Future createSupport(uid, pid) async {
    var support = await _friendsRepository.createSupport(uid, pid);
    // support 보내기
    return support;
  }

  Future createEncourage(uid, pid) async {
    var encourage = await _friendsRepository.createEncourage(uid, pid);
    // encourage 보내기
    return encourage;
  }

// promise 제안하기
/*
  Future suggestPromise(uid, promise) async {
    var promise = await _friendsRepository.suggestPromise(uid, promise);
    return promise;
  }
   */
}
