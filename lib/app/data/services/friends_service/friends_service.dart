import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/services/friends_service/friends_repository.dart';
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

  // pList 받기
  Future<List<String>> getPList(String uid) async {
    List<String> promiseList = await _friendsRepository.getPList(uid);
    return promiseList;
  }

  Future createSupportService(uid, pid) async {
    await _friendsRepository.createSupport(uid, pid);
    // support 보내기
  }

  Future createEncourage(uid, pid) async {
    await _friendsRepository.createSupport(uid, pid);
    // support 보내기
  }
}
