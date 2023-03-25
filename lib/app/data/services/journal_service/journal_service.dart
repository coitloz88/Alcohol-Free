import 'dart:developer';

import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_repository.dart';
import 'package:get/get.dart';

import '../../models/journal.dart';

class JournalService extends GetxService {
  static JournalService get to => Get.find<JournalService>();
  final JournalRepository _journalRepository = JournalRepository();

  List<Journal> _journalList = [];

  List<Journal> get journalList => _journalList;

  Future<JournalService> init() async {
    _journalList = await _journalRepository.readJournalList();
    return this;
  }

  Future<DrinkingJournal> createDrinkingJournal(journal) async {
    // 그럼 여기서 값을 받을 때 service 부분이요!
    journal.jid = await _journalRepository.createJournal(journal);
    _journalList.add(journal);
    return journal;
  }

  Future<SobrietyJournal> createSobrietyJournal(journal) async {
    journal.jid = await _journalRepository.createJournal(journal);
    _journalList.add(journal);
    return journal;
  }

  /*
    // get Journal -> 읽은 후 type으로 뭔지 판단
  Future<List<Journal?>> getJournalListWithinThePeriod(
      DateTime from, DateTime to) async {
    // from 보다 커야하고 to 보다 작아야 한다!
    List<Map<String, dynamic>> journalJsonList =
        await _dbProvider.readJournalList();
    List<Journal?> journalList = journalJsonList.map((journalJson) {
      var time = Journal.fromJson(journalJson).date;
      if (from.difference(time).inDays <= 0 &&
          to.difference(time).inDays >= 0) {
        return Journal.fromJson(journalJson);
      }
    }).toList();

    return journalList;
  }
   */
  List<Journal?> getJournalListWithinThePeriod(DateTime from, DateTime to) {
    //log(_journalList.toString());
    List<Journal?> journalListWithinThePeriod = _journalList.map((journalJson) {
      var time = journalJson.date;
      if (from.compareTo(time) <= 0 && to.compareTo(time) >= 0) {
        return journalJson;
      }
    }).toList();
    return journalListWithinThePeriod;
  }
}
