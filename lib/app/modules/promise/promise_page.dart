import 'package:alcohol_free/app/modules/promise/local_widgets/friend_tab_view.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_tab_view.dart';
import 'package:alcohol_free/app/modules/promise/promise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_free/app/utils/widget_layout_data.dart';
import 'package:alcohol_free/app/utils/screen_size.dart';

class PromisePage extends StatefulWidget {
  const PromisePage({super.key});

  @override
  State<PromisePage> createState() => _PromisePageState();
}

class _PromisePageState extends State<PromisePage> {
  final GlobalKey _pageKey = GlobalKey();

  Size? size;

  @override
  void initState() {
    super.initState();

    Get.put(PromisePageController());

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
                      FriendTabView(),
                    ],
                  )),
                ],
              ),
            ),
          )
        ]);
  }
}
