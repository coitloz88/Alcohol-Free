import 'package:alcohol_free/app/modules/promise/local_widgets/friend_list_item_view.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/progress_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../promise_page_controller.dart';

class FriendPromiseListView extends StatefulWidget {
  const FriendPromiseListView(
      {Key? key}) : super(key: key);

  @override
  State<FriendPromiseListView> createState() => _FriendPromiseListViewState();
}

class _FriendPromiseListViewState extends State<FriendPromiseListView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromisePageController>(builder: (controller) {
      return Expanded(
        child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.getFriends().length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FriendListItemView(
                          controller.getFriends()[index]),
                    ],
                  );
                })),
      );
    });
  }
}
