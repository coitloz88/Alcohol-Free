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
                print('친구 추가 pressed');
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
