import 'package:flutter/material.dart';

class WidgetWithLeftHeading extends StatefulWidget {
  final String heading;
  final Widget childWidget;

  const WidgetWithLeftHeading({
    super.key,
    required this.heading,
    required this.childWidget,
  });

  @override
  State<WidgetWithLeftHeading> createState() => _WidgetWithLeftHeadingState();
}

class _WidgetWithLeftHeadingState extends State<WidgetWithLeftHeading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.heading,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        widget.childWidget,
      ],
    );
  }
}
