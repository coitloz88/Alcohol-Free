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
            appBar: AppBar(
                title: Text('술 안 마신 날',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: BackButton(
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                )),
            body: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 40,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MoodSelectionRow(controller.moodTypeWrapper),
                        TextBoxWithHeading(
                          textEditingController:
                              controller.textEditingController,
                          heading: "왜 이런 기분이 들었나요?",
                          hint: "기분을 기록해보세요",
                          height: 300,
                          minHeight: 200,
                          maxHeight: 400,
                        ),
                      ],
                    ),
                  ),
                )),
            bottomSheet: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ConfirmButton(
                buttonText: "저장하기",
                onPressed: () {
                  controller.onConfirm();
                  Get.back();
                },
              ),
            ),
          );
        });
  }
}
