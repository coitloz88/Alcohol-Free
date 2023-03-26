import 'package:alcohol_free/app/data/enums/mood_type.dart';
import 'package:flutter/material.dart';

class MoodSelectionRow extends StatelessWidget {
  const MoodSelectionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional(-0.8, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              '오늘의 기분은 어땠나요?',
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            MoodButton(MoodType.sad),
            MoodButton(MoodType.angry),
            MoodButton(MoodType.relaxed),
            MoodButton(MoodType.happy),
            MoodButton(MoodType.joyful),
          ],
        )
      ],
    );
  }
}

class MoodButton extends StatefulWidget {
  const MoodButton(this.moodType, {Key? key}) : super(key: key);
  final MoodType moodType;

  @override
  State<MoodButton> createState() => _MoodButtonState();
}

class _MoodButtonState extends State<MoodButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("${widget.moodType.name} pressed"),
      child: Column(
        children: [
          Image.asset('assets/images/${widget.moodType.name}.png'),
          Text(widget.moodType.name)
        ],
      ),
    );
  }
}
