import 'package:alcohol_free/app/widgets/afree_drop_down_button.dart';
import 'package:alcohol_free/app/widgets/confirm_button.dart';
import 'package:alcohol_free/app/widgets/mood_selection_row.dart';
import 'package:alcohol_free/app/widgets/textbox_with_heading.dart';
import 'package:alcohol_free/app/widgets/widget_with_left_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrinkingJournalPage extends StatelessWidget {
  const DrinkingJournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              MoodSelectionRow(),
              WidgetWithLeftHeading(
                  heading: '오늘은 무슨 일로 마시게 되었나요?',
                  childWidget: AFreeDropDownButton(
                    options: ['약속', '회식', '먹고 싶어서', '분위기'],
                    initialOption: '약속',
                  )),
              WidgetWithLeftHeading(
                  heading: '오늘은 무슨 일로 마시게 되었나요?',
                  childWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: AFreeDropDownButton(
                            options: ['약속', '회식', '먹고 싶어서', '분위기'],
                            initialOption: '약속',
                          )),
                      Flexible(
                          flex: 1,
                          child: AFreeDropDownButton(
                            options: ['약속', '회식', '먹고 싶어서', '분위기'],
                            initialOption: '약속',
                          ))
                    ],
                  )),
              TextBoxWithHeading(heading: '메모', height: 70),
              ConfirmButton(buttonText: '저장하기')
            ],
          )),
    ));
  }
}
