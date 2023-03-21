import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_repository.dart';
import 'package:get/get.dart';

class PromiseService extends GetxService {
  static PromiseService get to => Get.find<PromiseService>();
  final PromiseRepository _promiseRepository = PromiseRepository();

  List<Promise> _promiseList = [];

  List<Promise> get promiseList => _promiseList;

  Future<PromiseService> init() async {
    _promiseList = await _promiseRepository.readPromiseList();
    return this;
  }

  Future<Promise> createPromise(name, from, to, requisite, levelOfAccess, memo, friends) async {
    Promise promise = Promise(name, from, to, requisite, levelOfAccess, memo, friends);
    promise.pid = await _promiseRepository.createPromise(promise);
    _promiseList.add(promise);
    return promise;
  }
}
