import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/friends_service/friends_service.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPromisePageController extends GetxController {
  bool _isPublic = false;
  bool _isNotification = false;
  List<AlcoholFreeUserFriend> _selectedFriends = [];
  String pid = '';

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController rewardEditingController = TextEditingController();
  TextEditingController memoEditingController = TextEditingController();

  bool get isPublic => _isPublic;
  bool get isNotification => _isNotification;
  List<AlcoholFreeUserFriend> get selectedFriends => _selectedFriends;

  void updateIsPublic(bool newIsPublic) {
    _isPublic = newIsPublic;
    update();
  }

  void updateIsNotification(bool newIsNotification) {
    _isNotification = newIsNotification;
    update();
  }

  void onConfirm(Promise newPromise) {
    PromiseService.to.createPromise(newPromise);
    update();
  }

  void updateSelectedFriends(AlcoholFreeUserFriend friend) {
    int listIndex = _selectedFriends.indexOf(friend);

    if (listIndex == -1) {
      _selectedFriends.add(friend);
    } else {
      _selectedFriends.removeAt(listIndex);
    }
  }

  Future<void> suggestPromise(String uid, String pid) async {
    return FriendsService.to.createSupport(uid, pid);
  }
}
