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

  Future<List<Journal?>> getJournalListWithinThePeriod(
      DateTime from, DateTime to) async {
    var journalListWithinThePeriod =
        await _journalRepository.getJournalListWithinThePeriod(from, to);
    return journalListWithinThePeriod;
  }
}
