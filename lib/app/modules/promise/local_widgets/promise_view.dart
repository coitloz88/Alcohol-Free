import 'package:alcohol_free/app/modules/promise/local_widgets/progress_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../data/models/promise.dart';
import '../promise_page_controller.dart';

class PromiseListView extends StatefulWidget {
  final double listViewHeight;

  PromiseListView({Key? key, required this.listViewHeight}) : super(key: key);

  @override
  State<PromiseListView> createState() => _PromiseListViewState();
}

class _PromiseListViewState extends State<PromiseListView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromisePageController>(builder: (controller) {
      return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Align(
              alignment: AlignmentDirectional(-1, -1),
              child: Text(
                '진행중인 약속',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
                height: widget.listViewHeight,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.getPromiseList().length,
                    itemBuilder: (context, index) {
                      return ProgressListItemView(
                          controller.getPromiseList()[index]);
                    })),
          ]));
    });
  }
}
