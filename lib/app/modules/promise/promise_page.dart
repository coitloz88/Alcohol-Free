import 'package:alcohol_free/app/data/models/progress_list_item_data.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/progress_list_item.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_sort.dart';

class PromiseView extends StatelessWidget {
  const PromiseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PromiseTab());
  }
}

class PromiseTab extends StatefulWidget {
  const PromiseTab({Key? key}) : super(key: key);

  @override
  State<PromiseTab> createState() => _PromiseTabState();
}

class _PromiseTabState extends State<PromiseTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: const [
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Color(0xFFB3B3B3),
                    indicatorColor: Color(0xFFFFAC30),
                    tabs: [
                      Tab(
                        text: '나의 약속',
                      ),
                      Tab(
                        text: '친구의 약속',
                      ),
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [PromiseTabView(), PromiseTabView()],
                  )),
                ],
              ),
            ),
          )
        ]);
  }
}

class PromiseTabView extends StatelessWidget {
  const PromiseTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: const [
        PromiseSortContainer(),
        PromiseStatusView(),
        PromiseStatusView()
      ],
    );
  }
}
