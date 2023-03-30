import 'package:alcohol_free/app/data/enums/mood_type.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoodSelectionRow extends StatelessWidget {
  MoodSelectionRow(this.moodTypeWrapper, {Key? key}) : super(key: key);
  MoodTypeWrapper moodTypeWrapper;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '오늘의 기분은 어땠나요?',
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MoodButton(MoodType.sad, moodTypeWrapper),
            MoodButton(MoodType.angry, moodTypeWrapper),
            MoodButton(MoodType.relaxed, moodTypeWrapper),
            MoodButton(MoodType.happy, moodTypeWrapper),
            MoodButton(MoodType.joyful, moodTypeWrapper),
          ],
        )
      ],
    );
  }
}

class MoodButton extends StatefulWidget {
  MoodButton(this.moodType, this.moodTypeWrapper, {Key? key}) : super(key: key);
  final MoodType moodType;
  MoodTypeWrapper moodTypeWrapper;

  @override
  State<MoodButton> createState() => _MoodButtonState();
}

class _MoodButtonState extends State<MoodButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.moodTypeWrapper.moodType = widget.moodType;
        print(widget.moodTypeWrapper.moodType);
      },
      child: Column(
        children: [
          Image.asset('assets/images/${widget.moodType.name}.png'),
          Text(widget.moodType.name)
        ],
      ),
    );
  }
}
