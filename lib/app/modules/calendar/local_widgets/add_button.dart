import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('버튼 누름...');
        },
        child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: const Center(child: Text('기록해보아요!'))));
  }
}
