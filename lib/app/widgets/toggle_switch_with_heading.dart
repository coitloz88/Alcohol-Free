import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleSwitchWithHeading extends StatefulWidget {
  final String heading;
  final bool initValue;
  Function(bool) handleToggle;

  ToggleSwitchWithHeading(
      {super.key,
      required this.heading,
      required this.initValue,
      required this.handleToggle});

  @override
  State<ToggleSwitchWithHeading> createState() =>
      _ToggleSwitchWithHeadingState();
}

class _ToggleSwitchWithHeadingState extends State<ToggleSwitchWithHeading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.heading,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Switch(
          value: widget.initValue,
          onChanged: (bool value) {
            widget.handleToggle(value);
          },
        ),
      ],
    );
  }
}
