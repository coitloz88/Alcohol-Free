import 'package:alcohol_free/app/modules/drinking_journal_add/drinking_journal_page.dart';
import 'package:alcohol_free/app/modules/drinking_journal_add/drinking_journal_page_controller.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page.dart';
import 'package:alcohol_free/app/modules/sobriety_journal/sobriety_journal_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  final Image buttonImage;
  final bool isSober;

  const AddButton(
      {super.key, required this.buttonImage, required this.isSober});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          isSober
              ? Get.to(SobrietyJournalPageView(), binding: BindingsBuilder(() {
                  Get.put(SobrietyJournalPageController());
                }))
              : Get.to(DrinkingJournalPage(), binding: BindingsBuilder(() {
                  Get.put(DrinkingJournalPageController());
                }));
        },
        child: Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Center(child: buttonImage)));
  }
}
