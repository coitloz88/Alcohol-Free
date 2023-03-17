import 'dart:developer';
import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrinkingJournalProvider extends GetxService {
  static DrinkingJournalProvider get to => Get.find<DrinkingJournalProvider>();

  Future<DrinkingJournal?> writeDrinkingJournal() async {
    try {
      // journal 쓰기
    } catch (e) {
      log("ERROR(AuthProvider.signInWithGoogle): ${e.toString()}");
    }
    return null;
  }

  Future<List<DrinkingJournal>?> getDrinkingJournalList() async {
    try {
      // journal 가져오기
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      log("ERROR(AuthProvider.signInWithEmailAndPassword): ${e.toString()}");
    }
    return null;
  }
}
