import 'package:alcohol_free/app/modules/sobriety_journal/local_widgets/journal_heading.dart';
import 'package:alcohol_free/app/widgets/mood_selection_row.dart';
import 'package:alcohol_free/app/widgets/textbox_with_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SobrietyJournalPageView extends StatelessWidget {
  const SobrietyJournalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        JournalHeading("술 안 마신 날"),
        MoodSelectionRow(),
        TextBoxWithHeading(
          heading: "왜 이런 기분이 들었나요?",
          hint: "기분을 기록해보세요",
          height: 300,
        ),
      ],
    );
  }
}
