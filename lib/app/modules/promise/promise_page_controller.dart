import 'dart:developer';

import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
import 'package:get/get.dart';

class PromisePageController extends GetxController {
  List<Promise> getPromiseList(bool isAlone) {
    log(PromiseService.to.promiseList.toString());
    if (isAlone)
      return PromiseService.to.getAlonePromiseList();
    else
      return PromiseService.to.getWithPromiseList();
  }
}
