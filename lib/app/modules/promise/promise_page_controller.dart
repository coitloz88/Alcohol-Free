import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/data/services/promise_service/promise_service.dart';
import 'package:get/get.dart';

class PromisePageViewController extends GetxController {
  double _ratio = 0.0;
  double get ratio => _ratio;

  void updatePromiseProgressRatio(double newRatio) {
    _ratio = newRatio;
    update();
  }

  List<Promise> getPromiseList() {
    PromiseService _promiseService = PromiseService.to;
    return _promiseService.promiseList;
  }
}
