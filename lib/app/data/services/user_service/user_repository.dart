import 'package:alcohol_free/app/data/models/alcohol_free_user.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';

class UserRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;
  final FirebaseAuthProvider _authProvider = FirebaseAuthProvider.to;

  bool isLoggedIn() {
    return _authProvider.isLoggedIn();
  }

  Future<AlcoholFreeUser> readUser() async {
    return AlcoholFreeUser.fromJson(await _dbProvider.readUser(_authProvider.getUid()!));
  }
}