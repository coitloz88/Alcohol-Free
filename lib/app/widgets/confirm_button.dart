import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {
  final String buttonText;

  const ConfirmButton({super.key, required this.buttonText});

  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              backgroundColor: Color.fromRGBO(255, 172, 48, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => print('버튼 눌림!'),
            child: Text(widget.buttonText)));
  }
}
