import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Image buttonImage;
  final bool isSober;

  const AddButton(
      {super.key, required this.buttonImage, required this.isSober});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          print('버튼 누름...');
        },
        child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Center(child: buttonImage)));
  }
}
