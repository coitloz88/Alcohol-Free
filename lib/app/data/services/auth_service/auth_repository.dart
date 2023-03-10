import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';

class AuthRepository {
  final FirebaseAuthProvider _firebaseAuthProvider = FirebaseAuthProvider.to;

  Future<AlcoholFreeUser?> signInWithGoogle() async {
    try {
      return _firebaseAuthProvider.signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return _firebaseAuthProvider.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<AlcoholFreeUser?> createAccount(String email, String password) async {
    try {
      return _firebaseAuthProvider.createAccount(email, password);
    } catch (e) {
      rethrow;
    }
  }
}
