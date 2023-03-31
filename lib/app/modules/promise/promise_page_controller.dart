import 'dart:developer';

import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/friends_service/friends_service.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
import 'package:get/get.dart';

class PromisePageController extends GetxController {
  List<Promise> getPromiseList(bool isAlone) {
    if (isAlone)
      return PromiseService.to.getAlonePromiseList();
    else
      return PromiseService.to.getWithPromiseList();
  }

  List<AlcoholFreeUserFriend> getFriends() {
    return FriendsService.to.friendList;
  }

  Future<List<Promise>> getFriendPromiseList(String uid) {
    return FriendsService.to.readPromiseList(uid);
  }

  Future<void> createSupport(String uid, String pid) async {
    print(uid);
    print(pid);
    return FriendsService.to.createSupport(uid, pid);
  }
}
