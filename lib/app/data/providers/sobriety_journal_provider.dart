import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../enums/journal_icon.dart';
import '../enums/level_of_being_drunk.dart';
import '../models/alcohol.dart';
import '../models/sobriety_journal.dart';

class SobrietyJournalProvider extends GetxService {
  static SobrietyJournalProvider get to => Get.find<SobrietyJournalProvider>();

  Future<SobrietyJournal?> writeSobrietyJournal(
      DateTime date,
      JournalIcon icon,
      String description,
      String? why,
      String? where,
      List<String>? friends, // 프리셋 제공
      LevelOfBeingDrunk? levelOfBeingDrunk,
      DateTime? from,
      to,
      Alcohol? alcohol,
      int? howmany,
      String? hangoverMemo) async {
    try {
      // journal 쓰기
    } catch (e) {
      log("ERROR(AuthProvider.signInWithGoogle): ${e.toString()}");
    }
    return null;
  }

  Future<List<SobrietyJournal>?> getSobrietyJournalList() async {
    try {
      // journal 가져오기
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      log("ERROR(AuthProvider.signInWithEmailAndPassword): ${e.toString()}");
    }
    return null;
  }
}
