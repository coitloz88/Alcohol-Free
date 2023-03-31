import 'package:alcohol_free/app/modules/drinking_journal_add/drinking_journal_page_controller.dart';
import 'package:alcohol_free/app/widgets/afree_drop_down_button.dart';
import 'package:alcohol_free/app/widgets/confirm_button.dart';
import 'package:alcohol_free/app/widgets/mood_selection_row.dart';
import 'package:alcohol_free/app/widgets/textbox_with_heading.dart';
import 'package:alcohol_free/app/widgets/widget_with_left_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quantity_input/quantity_input.dart';

class DrinkingJournalPage extends StatefulWidget {
  const DrinkingJournalPage({super.key});

  @override
  State<DrinkingJournalPage> createState() => _DrinkingJournalPageState();
}

class _DrinkingJournalPageState extends State<DrinkingJournalPage> {
  final List<String> timeList =
      List<int>.generate(24, (i) => i + 1).map((time) {
    return time.toString();
  }).toList();

  @override
  void initState() {
    super.initState();

    Get.put(DrinkingJournalPageController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrinkingJournalPageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
              title: Center(
                  child: Text('술 마신 날', style: TextStyle(color: Colors.black))),
              backgroundColor: Colors.white,
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Get.back();
                },
              )),
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Wrap(
                  runSpacing: 12,
                  children: [
                    MoodSelectionRow(controller.moodTypeWrapper),
                    WidgetWithLeftHeading(
                        heading: '오늘은 무슨 일로 마시게 되었나요?',
                        childWidget: AFreeDropDownButton(
                          options: ['약속', '회식', '먹고 싶어서', '분위기'],
                          initialOption: '약속',
                        )),
                    WidgetWithLeftHeading(
                        heading: '누구랑?',
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                flex: 1,
                                child: AFreeDropDownButton(
                                  options: ['친구', '가족', '혼자', '직장 동료'],
                                  initialOption: '친구',
                                )),
                            Flexible(
                                flex: 1,
                                child: QuantityInput(
                                  value: controller.numberOfPerson,
                                  step: 1,
                                  iconColor: Colors.black,
                                  decoration: InputDecoration(
                                    fillColor: Color(0xFFFFAC30),
                                    focusColor: Color(0xFFFFAC30),
                                  ),
                                  onChanged: (value) {
                                    controller.updateNumberOfPerson(
                                        int.parse(value.replaceAll(',', '')));
                                  },
                                ))
                          ],
                        )),
                    WidgetWithLeftHeading(
                        heading: '언제',
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AFreeDropDownButton(
                                options: timeList,
                                initialOption: '1',
                              ),
                            ),
                            Text('시부터'),
                            const SizedBox(width: 8),
                            Flexible(
                              flex: 1,
                              child: AFreeDropDownButton(
                                options: timeList,
                                initialOption: '1',
                              ),
                            ),
                            Text('시까지')
                          ],
                        )),
                    WidgetWithLeftHeading(
                        heading: '취함의 정도',
                        childWidget: Center(
                            child: ToggleButtons(
                          children: [Text('멀쩡해요'), Text('적당해요'), Text('만취했어요')],
                          isSelected: controller.selectedDrinkState,
                          fillColor: Color(0xFFFFAC30),
                          constraints:
                              BoxConstraints(minHeight: 44, minWidth: 100),
                          onPressed: controller.updateSelectedDrinkState,
                        ))),
                    WidgetWithLeftHeading(
                        heading: '술 종류',
                        childWidget:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: AFreeDropDownButton(
                                    options: [
                                      '맥주',
                                      '소주',
                                      '와인',
                                      '위스키',
                                      '칵테일',
                                      '하이볼'
                                    ],
                                    initialOption: '맥주',
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: QuantityInput(
                                    value: controller.numberOfAlcohol,
                                    step: 1,
                                    iconColor: Colors.black,
                                    decoration: InputDecoration(
                                      fillColor: Color(0xFFFFAC30),
                                      focusColor: Color(0xFFFFAC30),
                                    ),
                                    onChanged: (value) {
                                      controller.updateNumberOfAlcohol(
                                          int.parse(value.replaceAll(',', '')));
                                    },
                                  ))
                            ],
                          ),
                          Container(
                              width: 350,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xFFf3f3f3),
                                  borderRadius: BorderRadius.circular(22.5)),
                              child: Center(child: Text('+ 주종 추가')))
                        ])),
                    TextBoxWithHeading(
                      heading: '돈 얼마 썼는지',
                      height: 44,
                      suffixText: '원',
                      textEditingController: controller.moneyEditingController,
                    ),
                    TextBoxWithHeading(
                      heading: '메모',
                      height: 70,
                      textEditingController: controller.memoEditingController,
                    ),
                    ConfirmButton(
                      buttonText: '저장하기',
                      onPressed: () => Get.back(),
                    )
                  ],
                )),
          ));
    });
  }
}
