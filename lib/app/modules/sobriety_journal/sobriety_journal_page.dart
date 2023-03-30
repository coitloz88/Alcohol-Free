import 'package:alcohol_free/app/modules/sobriety_journal/local_widgets/journal_heading.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:alcohol_free/app/widgets/confirm_button.dart';
import 'package:alcohol_free/app/widgets/mood_selection_row.dart';
import 'package:alcohol_free/app/widgets/textbox_with_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SobrietyJournalPageView extends StatelessWidget {
  const SobrietyJournalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SobrietyJournalPageController>(
        init: SobrietyJournalPageController(),
        builder: (controller) {
          return Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    JournalHeading("술 안 마신 날"),
                    MoodSelectionRow(controller.moodTypeWrapper),
                    TextBoxWithHeading(
                      textEditingController: controller.textEditingController,
                      heading: "왜 이런 기분이 들었나요?",
                      hint: "기분을 기록해보세요",
                      height: 300,
                    ),
                    ConfirmButton(
                      buttonText: "저장하기",
                      onPressed: () {
                        controller.onConfirm();
                        Get.back();
                      },
                    ),
                  ],
                )),
          );
        });
  }
}
