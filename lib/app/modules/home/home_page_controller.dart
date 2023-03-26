import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/services/user_service/user_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  AlcoholFreeUser getUser() {
    return UserService.to.user;
  }
}
