import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_repository.dart';
import 'package:get/get.dart';

class PromiseService extends GetxService {
  static PromiseService get to => Get.find<PromiseService>();
  final PromiseRepository _promiseRepository = PromiseRepository();

  List<Promise> _promiseList = [];

  List<Promise> get promiseList => _promiseList;

  Future<PromiseService> init() async {
    if(_promiseRepository.isLoggedIn()) {
      _promiseList = await _promiseRepository.readPromiseList();
      updatePromiseListCompletionStatus();
    }
    return this;
  }

  Future<Promise> createPromise(name, from, to, requisite, levelOfAccess, memo, friends) async {
    Promise promise = Promise(name, from, to, requisite, levelOfAccess, memo, friends);
    promise.pid = await _promiseRepository.createPromise(promise);
    _promiseList.add(promise);
    return promise;
  }

  void updatePromiseListCompletionStatus() {
    for (Promise promise in _promiseList) {
      List<Journal> journalWithinPeriod = JournalService.to.getJournalListWithinThePeriod(promise.from, promise.to);
      promise.requisite.updateCompletionStatus(journalWithinPeriod);
    }
  }
}
