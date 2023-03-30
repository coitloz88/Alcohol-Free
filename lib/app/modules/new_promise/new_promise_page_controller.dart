import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPromisePageController extends GetxController {
  bool _isPublic = false;
  bool _isNotification = false;
  TextEditingController textEditingController = TextEditingController();

  bool get isPublic => _isPublic;
  bool get isNotification => _isNotification;

  void updateIsPublic(bool newIsPublic) {
    _isPublic = newIsPublic;
    update();
  }

  void updateIsNotification(bool newIsNotification) {
    _isNotification = newIsNotification;
    update();
  }
}
