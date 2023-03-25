import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'current_promise_listitem_view.dart';

class CurrentPromiseView extends StatelessWidget {
  const CurrentPromiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 7,
          children: const [
            Text('지키는 중인 약속 number',
                style: TextStyle(fontWeight: FontWeight.w700)),
            CurrentPromiseListView()
          ],
        ));
  }
}

class CurrentPromiseListView extends StatelessWidget {
  const CurrentPromiseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 460, //TODO: 화면 크기 기준으로
        height: 241,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) =>
              CurrentPromiseListItemContainer(index: index),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ));
  }
}
