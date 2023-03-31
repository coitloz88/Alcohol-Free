import 'package:alcohol_free/app/modules/new_promise/new_promise_page.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_sort_option.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromiseTabView extends StatelessWidget {
  final double height;

  const PromiseTabView({Key? key, required this.height}) : super(key: key);

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
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Text(
                    '혼자 하는 약속',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )),
            PromiseListView(listViewHeight: height, isAlone: true),
            const SizedBox(height: 10),
            const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Align(
                  alignment: AlignmentDirectional(-1, -1),
                  child: Text(
                    '함께 하는 약속',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )),
            PromiseListView(listViewHeight: height, isAlone: false),
          ],
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: FloatingActionButton(
                backgroundColor: Color(0xfff3f3f3),
                onPressed: () {
                  Get.to(const NewPromisePage(), binding: BindingsBuilder(() {
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
