import 'package:alcohol_free/app/data/services/friends_service/friends_service.dart';
import 'package:alcohol_free/app/modules/new_promise/local_widgets/friends_list_bottom_sheet.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:flutter/material.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FloatingActionButton(
              backgroundColor: Color(0xffFFF8EE),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Color(0x00FFffff),
                    context: context,
                    builder: (BuildContext context) {
                      return FriendsListBottomSheet();
                    });
              },
              child: const Icon(
                Icons.add,
                size: 24,
                color: Color(0xffE48900),
              )),
          const SizedBox(height: 4),
          const Text('추가하기')
        ]));
  }
}
