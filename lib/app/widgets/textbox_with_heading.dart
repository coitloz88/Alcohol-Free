
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-0.8, 0),
          child: Text(
            widget.heading,
          ),
        ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: const Color(0x25686767),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: GetBuilder<SobrietyJournalPageController>(
            builder: (controller) {
              return TextFormField(
                maxLines: null,
                expands: true,
                controller: controller.textEditingController,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  border: InputBorder.none,
                ),
              );
            }
          ),
        )
      ],
    );
  }
}
