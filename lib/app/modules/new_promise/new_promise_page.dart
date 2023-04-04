import 'package:alcohol_free/app/data/enums/level_of_access.dart';
import 'package:alcohol_free/app/data/models/day_based_requisite.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/modules/new_promise/local_widgets/add_friend_button.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:alcohol_free/app/widgets/confirm_button.dart';
import 'package:alcohol_free/app/modules/new_promise/local_widgets/data_picker.dart';
import 'package:alcohol_free/app/widgets/textbox_with_heading.dart';
import 'package:alcohol_free/app/widgets/toggle_switch_with_heading.dart';
import 'package:alcohol_free/app/widgets/widget_with_left_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewPromisePage extends StatefulWidget {
  const NewPromisePage({super.key});

  @override
  State<NewPromisePage> createState() => _NewPromisePageState();
}

class _NewPromisePageState extends State<NewPromisePage> {
  final List<String> timeList =
      List<int>.generate(24, (i) => i + 1).map((time) {
    return time.toString();
  }).toList();

  @override
  void initState() {
    super.initState();

    Get.put(NewPromisePageController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPromisePageController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
              title: Center(
                  child: Text('목표 추가', style: TextStyle(color: Colors.black))),
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
                  runSpacing: 12.0,
                  children: [
                    TextBoxWithHeading(
                      heading: '목표 이름',
                      height: 44,
                      hint: '어떤 목표인지 알려주세요:)',
                      textEditingController: controller.nameEditingController,
                    ),
                    TextBoxWithHeading(
                      heading: '보상',
                      height: 44,
                      textEditingController: controller.rewardEditingController,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DataPickerWithHeading(heading: '시작일', dayBuffer: 0),
                          DataPickerWithHeading(heading: '종료일', dayBuffer: 1)
                        ]),
                    ToggleSwitchWithHeading(
                        heading: '공개여부',
                        initValue: controller.isPublic,
                        handleToggle: (value) =>
                            {controller.updateIsPublic(value)}),
                    ToggleSwitchWithHeading(
                        heading: '알람',
                        initValue: controller.isNotification,
                        handleToggle: (value) =>
                            {controller.updateIsNotification(value)}),
                    TextBoxWithHeading(
                      heading: '메모',
                      height: 70,
                      textEditingController: controller.memoEditingController,
                    ),
                    Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: WidgetWithLeftHeading(
                            heading: '지킴이', childWidget: AddFriendButton())),
                    ConfirmButton(
                      buttonText: '시작하기',
                      onPressed: () {
                        controller.onConfirm(Promise(
                            controller.nameEditingController.text,
                            controller.rewardEditingController.text,
                            controller.from,
                            controller.timeTo,
                            DayBased('Once a week', controller.from,
                                controller.timeTo, 0, false),
                            //금주 or 절주
                            controller.isPublic
                                ? LevelOfAccess.public
                                : LevelOfAccess.private,
                            //공개 여부
                            controller.memoEditingController.text,
                            controller.selectedFriends,
                            0));
                        Get.back(result: 1);
                      },
                    )
                  ],
                )),
          ));
    });
  }
}

void suggestPromise(String friendUid, String pid) async {
  await Get.find<NewPromisePageController>().suggestPromise(friendUid, pid);

  Fluttertoast.showToast(
      msg: '추가 요청이 완료되었습니다.',
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.black,
      backgroundColor: Color(0xffF0F0F0));
}
