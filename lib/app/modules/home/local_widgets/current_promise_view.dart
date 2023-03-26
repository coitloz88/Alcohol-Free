import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/modules/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'current_promise_listitem_view.dart';

class CurrentPromiseView extends StatefulWidget {
  const CurrentPromiseView({super.key});

  @override
  State<CurrentPromiseView> createState() => _CurrentPromiseViewState();
}

class _CurrentPromiseViewState extends State<CurrentPromiseView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      List<Promise> promiseList = controller.getPromiseList();
      return Container(
          width: double.infinity,
          child: Wrap(
            direction: Axis.vertical,
            spacing: 7,
            children: [
              Text('지키는 중인 약속 ${promiseList.length}',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              CurrentPromiseListView(promiseList)
            ],
          ));
    });
  }
}

class CurrentPromiseListView extends StatelessWidget {
  const CurrentPromiseListView(this.promiseList, {Key? key}) : super(key: key);
  final List<Promise> promiseList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 460, //TODO: 화면 크기 기준으로
        height: 241,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: promiseList.length,
          itemBuilder: (context, index) =>
              CurrentPromiseListItemContainer(promise: promiseList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ));
  }
}
