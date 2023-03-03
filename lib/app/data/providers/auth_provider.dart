import 'dart:developer';

import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/core/values/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthProvider extends GetxService {
  static AuthProvider get to => Get.find<AuthProvider>();

  Future<AlcoholFreeUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return AlcoholFreeUser.fromUserCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthError.USER_NOT_FOUND) {
        rethrow;
      } else if (e.code == AuthError.INVALID_EMAIL) {
        rethrow;
      } else if (e.code == AuthError.WRONG_PASSWORD) {
        rethrow;
      }
      return null;
    } catch (e) {
      log("ERROR(AuthProvider.signInWithEmailAndPassword): ${e.toString()}");
      return null;
    }
  }

  Future<AlcoholFreeUser?> createAccount(
      String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return AlcoholFreeUser.fromUserCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthError.EMAIL_ALREADY_IN_USE) {
        rethrow;
      } else if (e.code == AuthError.WEAK_PASSWORD) {
        rethrow;
      }
      return null;
    } catch (e) {
      log("ERROR(AuthService.createAccount): ${e.toString()}");
      return null;
    }
  }
}
