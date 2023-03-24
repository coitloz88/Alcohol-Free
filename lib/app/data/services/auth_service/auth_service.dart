import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/services/auth_service/auth_repository.dart';
import 'package:alcohol_free/app/data/services/user_service/user_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();
  final AuthRepository _authRepository = AuthRepository();

  Future<AlcoholFreeUser?> signInWithGoogle() async {
    try {
      AlcoholFreeUser? alcoholFreeUser =
          await _authRepository.signInWithGoogle();
      if (alcoholFreeUser != null) {
        UserService.to.user = alcoholFreeUser;
      }
      return alcoholFreeUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      AlcoholFreeUser? alcoholFreeUser =
          await _authRepository.signInWithEmailAndPassword(email, password);
      if (alcoholFreeUser != null) {
        UserService.to.user = alcoholFreeUser;
      }
      return alcoholFreeUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> createAccount(String email, String password) async {
    try {
      AlcoholFreeUser? alcoholFreeUser =
          await _authRepository.createAccount(email, password);
      if (alcoholFreeUser != null) {
        UserService.to.user = alcoholFreeUser;
      }
      return alcoholFreeUser;
    } catch (e) {
      rethrow;
    }
  }
}
