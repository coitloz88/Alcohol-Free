import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/journal_service/journal_service.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_repository.dart';
import 'package:get/get.dart';

class PromiseService extends GetxService {
  static PromiseService get to => Get.find<PromiseService>();
  final PromiseRepository _promiseRepository = PromiseRepository();

  List<Promise> _promiseList = [];
  int _sumOfSupports = 0;
  List<Promise> _sharedPromiseList = [];

  List<Promise> get promiseList => _promiseList;
  int get sumOfSupports => _sumOfSupports;

  List<Promise> get sharedPromiseList => _sharedPromiseList;

  Future<PromiseService> init() async {
    if (_promiseRepository.isLoggedIn()) {
      _promiseList = await _promiseRepository.readPromiseList();
      _sumOfSupports = await _promiseRepository.getSumOfSupports();
      _sharedPromiseList = await _promiseRepository.getFriendsPromiseList();
      updatePromiseListCompletionStatus();
    }
    return this;
  }

  //1. promiseList를 순회하면서, 해당 listItem의 friend 리스트 길이가 0인 것만 filtering 해서 promistList를 반환하는 함수
  //2. promiseList를 순회하면서, listItem의 friend 리스트 길이가 1 이상인 것만 filtering 해서 promiseList를 반환하는 함수

  List<Promise> getAlonePromiseList() {
    return _promiseList
        .where((promise) =>
            promise.friends != null ? promise.friends?.length == 0 : false)
        .toList();
  }

  List<Promise> getWithPromiseList() {
    return _promiseList
        .where((promise) =>
            promise.friends != null ? promise.friends?.length != 0 : false)
        .toList();
  }

  Future<Promise> createPromise(Promise promise) async {
    promise.pid = await _promiseRepository.createPromise(promise);
    _promiseList.add(promise);
    return promise;
  }

  void updatePromiseListCompletionStatus() {
    for (Promise promise in _promiseList) {
      List<Journal> journalWithinPeriod = JournalService.to
          .getJournalListWithinThePeriod(promise.from, promise.to);
      promise.requisite.updateCompletionStatus(journalWithinPeriod);
    }
  }
}
