import 'package:alcohol_free/app/widgets/widget_with_left_heading.dart';
import 'package:flutter/material.dart';

class TextBoxWithHeading extends StatefulWidget {
  TextBoxWithHeading({
    required this.heading,
    this.hint,
    required this.height,
    this.minHeight,
    this.maxHeight,
    this.suffixText,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  final String heading;
  final String? hint;
  final String? suffixText;
  final double height;
  final double? minHeight;
  final double? maxHeight;

  TextEditingController textEditingController = TextEditingController();

  @override
  State<TextBoxWithHeading> createState() => _TextBoxWithHeadingState();
}

class _TextBoxWithHeadingState extends State<TextBoxWithHeading> {
  @override
  Widget build(BuildContext context) {
    return WidgetWithLeftHeading(
        heading: widget.heading,
        childWidget: Container(
          constraints: BoxConstraints(
            minHeight:
                widget.minHeight != null ? widget.minHeight! : widget.height,
            maxHeight:
                widget.maxHeight != null ? widget.maxHeight! : widget.height,
          ),
          decoration: BoxDecoration(
            color: const Color(0x25686767),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            maxLines: null,
            expands: true,
            controller: widget.textEditingController,
            decoration: InputDecoration(
                hintText: widget.hint,
                contentPadding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16,
                  right: 16,
                ),
                border: InputBorder.none,
                suffixText: widget.suffixText),
          ),
        ));
  }
}
