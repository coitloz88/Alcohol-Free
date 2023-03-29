import 'package:flutter/material.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FloatingActionButton(
          backgroundColor: Color(0xfff3f3f3),
          onPressed: () {
            print('친구 추가');
          },
          child: Icon(
            Icons.add,
            size: 24,
            color: Colors.black,
          )),
      Text('추가하기')
    ]);
  }
}
