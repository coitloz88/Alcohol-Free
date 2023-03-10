import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/services/auth_service/auth_repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find<AuthService>();
  final AuthRepository _authRepository = AuthRepository();

  Future<AlcoholFreeUser?> signInWithGoogle() async {
    try {
      return _authRepository.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _authRepository.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> createAccount(String email, String password) async {
    try {
      return _authRepository.createAccount(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
