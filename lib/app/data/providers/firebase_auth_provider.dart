import 'dart:developer';
import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:alcohol_free/core/values/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthProvider extends GetxService {
  static FirebaseAuthProvider get to => Get.find<FirebaseAuthProvider>();

  Future<AlcoholFreeUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential credential =
          await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
      return _getAlcoholFreeUser(credential);
    } catch (e) {
      log("ERROR(AuthProvider.signInWithGoogle): ${e.toString()}");
    }
    return null;
  }

  Future<AlcoholFreeUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _getAlcoholFreeUser(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthError.USER_NOT_FOUND) {
        rethrow;
      } else if (e.code == AuthError.INVALID_EMAIL) {
        rethrow;
      } else if (e.code == AuthError.WRONG_PASSWORD) {
        rethrow;
      }
    } catch (e) {
      log("ERROR(AuthProvider.signInWithEmailAndPassword): ${e.toString()}");
    }
    return null;
  }

  Future<AlcoholFreeUser?> createAccount(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _getAlcoholFreeUser(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == AuthError.EMAIL_ALREADY_IN_USE) {
        rethrow;
      } else if (e.code == AuthError.WEAK_PASSWORD) {
        rethrow;
      }
    } catch (e) {
      log("ERROR(AuthService.createAccount): ${e.toString()}");
    }
    return null;
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  String? getUid() {;
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<AlcoholFreeUser> _getAlcoholFreeUser(UserCredential credential) async {
    AlcoholFreeUser alcoholFreeUser;
    final FirestoreProvider dbProvider = FirestoreProvider.to;

    if (credential.additionalUserInfo!.isNewUser) {
      alcoholFreeUser = AlcoholFreeUser.fromUserCredential(credential);
      dbProvider.createUser(alcoholFreeUser.toJson());
    } else {
      alcoholFreeUser = AlcoholFreeUser.fromJson(
          await dbProvider.readUser(credential.user!.uid));
    }

    return alcoholFreeUser;
  }
}
