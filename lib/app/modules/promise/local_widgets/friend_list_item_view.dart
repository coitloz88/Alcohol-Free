import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/modules/promise/promise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FriendListItemView extends StatefulWidget {
  const FriendListItemView(this.friend, {Key? key}) : super(key: key);

  final AlcoholFreeUserFriend friend;

  @override
  State<FriendListItemView> createState() => _FriendListItemViewState();
}

class _FriendListItemViewState extends State<FriendListItemView> {
  Future<List<Widget>> getFriendPromiseList() async {
    List<Promise> promiseList = await Get.find<PromisePageController>()
        .getFriendPromiseList(widget.friend.uid);
    List<Widget> res = promiseList.map((promise) {
      Widget promiseItem = Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color(0xFFFFF8EE),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promise.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${promise.from.year.toString()}-${promise.from.month.toString().padLeft(2, '0')}-${promise.from.day.toString().padLeft(2, '0')}~${promise.to.year.toString()}-${promise.to.month.toString().padLeft(2, '0')}-${promise.to.day.toString().padLeft(2, '0')}',
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Text(
                          promise.requisite.name,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: promise.requisite.ratio,
                        width: 177,
                        lineHeight: 6,
                        animation: false,
                        progressColor: const Color(0xFFFFAC30),
                        backgroundColor: const Color(0xFFF1F4F8),
                        barRadius: const Radius.circular(5.5),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => {createSupport(promise)},
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/support.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "응원하기",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      return promiseItem;
    }).toList();

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFriendPromiseList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(fontSize: 15),
              ),
            );
          } else {
            if ((snapshot.data as List<Widget>).length == 0) {
              return Container();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/person.png',
                      width: 24,
                      height: 24,
                    ),
                    Text("${widget.friend.nickname} 님",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Column(children: snapshot.data),
              ],
            );
          }
        });
  }

  void createSupport(Promise promise) async {
    await Get.find<PromisePageController>()
        .createSupport(widget.friend.uid, promise.pid);

    Fluttertoast.showToast(
      msg: "'${promise.name}' 목표에 응원을 보냈습니다.",
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
      backgroundColor: Color(0xff747474),
    );
  }
}
