import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/providers/firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JournalRepository {
  final FirestoreProvider _dbProvider = FirestoreProvider.to;

  Future<String> createDrinkingJournal(DrinkingJournal drinkingJournal) async {
    DocumentReference drinkingJournalDocRef =
        await _dbProvider.createJournal(drinkingJournal.toJson());
    return drinkingJournalDocRef.id;
  }

  Future<String> createSobrietyJournal(SobrietyJournal sobrietyJournal) async {
    DocumentReference sobrietyJournalDocRef =
        await _dbProvider.createJournal(sobrietyJournal.toJson());
    return sobrietyJournalDocRef.id;
  }

  Future<List<Journal>> readJournalList() async {
    List<Map<String, dynamic>> journalJsonList =
        await _dbProvider.readJournalList();
    List<Journal> journalList = journalJsonList
        .map((journalJson) => Journal.fromJson(journalJson))
        .toList();

    return journalList;
  }
}
