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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '오늘의 기분은 어땠나요?',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoodButton(MoodType.sad, moodTypeWrapper),
              MoodButton(MoodType.angry, moodTypeWrapper),
              MoodButton(MoodType.relaxed, moodTypeWrapper),
              MoodButton(MoodType.happy, moodTypeWrapper),
              MoodButton(MoodType.joyful, moodTypeWrapper),
            ],
          ),
        )
      ],
    );
  }
}

class MoodButton extends StatefulWidget {
  MoodButton(this.moodType, this.moodTypeWrapper, {Key? key}) : super(key: key);
  final MoodType moodType;
  bool clicked = false;
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
        setState(() {
          widget.clicked = !widget.clicked;
        });
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/${widget.moodType.name}.png'),
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: !widget.clicked ? Color(0x000000) : Color(0x55000000),
                ),
              )
            ],
          ),
          Text(widget.moodType.name)
        ],
      ),
    );
  }
}
