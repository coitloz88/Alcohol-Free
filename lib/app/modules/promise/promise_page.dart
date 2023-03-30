import 'package:alcohol_free/app/modules/promise/local_widgets/promise_view.dart';
import 'package:alcohol_free/app/modules/promise/promise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_sort_option.dart';
import 'package:alcohol_free/app/utils/widget_layout_data.dart';
import 'package:alcohol_free/app/utils/screen_size.dart';

class PromisePageView extends StatelessWidget {
  const PromisePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PromisePageState();
  }
}

class PromisePageState extends StatefulWidget {
  const PromisePageState({Key? key}) : super(key: key);

  @override
  State<PromisePageState> createState() => _PromisePageState();
}

class _PromisePageState extends State<PromisePageState> {
  final GlobalKey _pageKey = GlobalKey();

  Size? size;

  @override
  void initState() {
    super.initState();

    Get.put(PromisePageViewController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        size = getSize(_pageKey);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = getScreenSize(context) ?? const Size(350, 800);
    final Size widgetSize = getSize(_pageKey) ?? (screenSize * 0.3);

    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  const TabBar(
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
                    children: [
                      PromiseTabView(height: widgetSize.height),
                      PromiseTabView(height: widgetSize.height)
                    ],
                  )),
                ],
              ),
            ),
          )
        ]);
  }
}

class PromiseTabView extends StatelessWidget {
  final double height;

  const PromiseTabView({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const PromiseSortOptionContainer(),
        PromiseListView(listViewHeight: height),
        PromiseListView(listViewHeight: height)
      ],
    );
  }
}
