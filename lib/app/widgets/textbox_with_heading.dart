import 'package:alcohol_free/app/widgets/widget_with_left_heading.dart';
import 'package:flutter/material.dart';

class TextBoxWithHeading extends StatefulWidget {
  const TextBoxWithHeading(
      {required this.heading, this.hint, required this.height, Key? key})
      : super(key: key);

  final String heading;
  final String? hint;
  final double height;

  @override
  State<TextBoxWithHeading> createState() => _TextBoxWithHeadingState();
}

class _TextBoxWithHeadingState extends State<TextBoxWithHeading> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WidgetWithLeftHeading(
        heading: widget.heading,
        childWidget: Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: const Color(0x25686767),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            maxLines: null,
            expands: true,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: const EdgeInsets.all(16.0),
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
