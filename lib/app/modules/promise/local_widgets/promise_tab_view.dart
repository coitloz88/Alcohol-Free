import 'package:alcohol_free/app/modules/new_promise/new_promise_page.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_sort_option.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromiseTabView extends StatelessWidget {
  final double height;
  final bool isMy;

  const PromiseTabView({Key? key, required this.height, required this.isMy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const PromiseSortOptionContainer(),
            PromiseListView(listViewHeight: height, isAlone: true),
            PromiseListView(listViewHeight: height, isAlone: false),
          ],
        ),
        if (isMy)
          Padding(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton(
                  backgroundColor: Color(0xfff3f3f3),
                  onPressed: () {
                    Get.to(NewPromisePage(), binding: BindingsBuilder(() {
                      Get.put(NewPromisePageController());
                    }));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  )))
      ],
    );
  }
}