import 'dart:developer';

import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/providers/firebase_auth_provider.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JournalRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;
  final FirebaseAuthProvider _authProvider = FirebaseAuthProvider.to;

  // create Journal -> type 포함해서 create
  Future<String> createJournal(Journal journal) async {
    DocumentReference journalDocRef =
        await _dbProvider.createJournal(journal.toJson());
    return journalDocRef.id;
  }

  // read Journal -> 읽은 후 type으로 뭔지 판단
  Future<List<Journal>> readJournalList() async {
    List<Map<String, dynamic>> journalJsonList =
        await _dbProvider.readJournalList();
    List<Journal> journalList = journalJsonList
        .map((journalJson) => Journal.fromJson(journalJson))
        .toList();

    return journalList;
  }

  bool isLoggedIn() {
    return _authProvider.isLoggedIn();
  }
}
