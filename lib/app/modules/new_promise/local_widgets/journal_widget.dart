import 'package:alcohol_free/app/data/models/drinking_journal.dart';
import 'package:alcohol_free/app/data/models/journal.dart';
import 'package:alcohol_free/app/data/models/sobriety_journal.dart';
import 'package:alcohol_free/app/modules/calendar/calendar_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JournalWidget extends StatefulWidget {
  const JournalWidget({Key? key}) : super(key: key);

  @override
  State<JournalWidget> createState() => _JournalWidgetState();
}

class _JournalWidgetState extends State<JournalWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarPageController>(builder: (controller) {
      var journal = controller.journal;
      var isSobriety = journal.runtimeType == SobrietyJournal;

      DrinkingJournal? drinking =
          isSobriety ? null : controller.journal as DrinkingJournal;

      return Container(
          child: Column(
        children: [
          Row(
            children: [
              Text(
                "${journal?.date.month}월 ${journal?.date.day}일 ${DateFormat('EEEE', 'ko').format(journal!.date)}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 32, bottom: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0x10E48900),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 4))
              ],
              borderRadius: BorderRadius.circular(20),
              border: Border.fromBorderSide(BorderSide(color: Colors.black)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/${journal?.icon}.png",
                  fit: BoxFit.contain,
                  width: 62,
                  height: 62,
                ),
                SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          isSobriety ? "금주했어요:)" : "술 마셨어요 :(",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          journal!.icon.toKorean(),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (journal?.description != "")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Color(0xffb3b3b3),
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6.0),
                              child: Text(
                                journal!.description,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      if (!isSobriety)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (drinking?.friends != 0)
                                Text(
                                    "• ${drinking?.friends?[0]} ${drinking?.friends?.length}명과 약속"),
                              Text(
                                  "• ${DateFormat("HH:mm").format(drinking!.from!)} 부터 ${DateFormat("HH:mm").format(drinking!.to!)}까지 마심"),
                              Text(
                                  "• ${drinking?.levelOfBeingDrunk?.toKorean()}"),
                              Text(
                                  "• ${drinking?.alcohol?.name} ${drinking?.howMany}${drinking?.alcohol?.alcoholContentPerUnit}"),
                              Text("• ${drinking?.expense}원 지출")
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/empty_profile.png",
                  height: 20,
                )
              ],
            ),
          )
        ],
      ));
    });
  }
}
