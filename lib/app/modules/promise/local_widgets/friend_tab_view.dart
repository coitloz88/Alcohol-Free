import 'package:alcohol_free/app/modules/promise/local_widgets/friend_promise_list_view.dart';
import 'package:alcohol_free/app/modules/promise/local_widgets/promise_sort_option.dart';
import 'package:flutter/material.dart';

class FriendTabView extends StatelessWidget {
  const FriendTabView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const PromiseSortOptionContainer(),
        FriendPromiseListView(),
      ],
    );
  }
}