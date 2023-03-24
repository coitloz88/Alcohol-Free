import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/services/user_service/user_repository.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find<UserService>();
  final UserRepository _userRepository = UserRepository();

  late AlcoholFreeUser _user;

  set user(AlcoholFreeUser value) {
    _user = value;
  }

  Future<UserService> init() async {
    if(_userRepository.isLoggedIn()) {
      _user = await _userRepository.readUser();
    }
    return this;
  }
}