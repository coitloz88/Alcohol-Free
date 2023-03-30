import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {
  final String buttonText;

  ConfirmButton({required this.onPressed, super.key, required this.buttonText});

  void Function() onPressed;

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
            onPressed: widget.onPressed,
            child: Text(widget.buttonText)));
  }
}
