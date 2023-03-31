import 'package:alcohol_free/app/data/services/friends_service/friends_service.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:flutter/material.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FloatingActionButton(
              backgroundColor: Color(0xffFFF8EE),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Color(0x00FFffff),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 900,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.only(top: 21),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 21, right: 21),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("목표 지켜봐줄 친구 추가하기"),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "닫기",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ],
                                ),
                              ),
                              Text(
                                  "추가 가능한 친구 ${FriendsService().friendList.length}"),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(
                Icons.add,
                size: 24,
                color: Color(0xffE48900),
              )),
          const SizedBox(height: 4),
          const Text('추가하기')
        ]));
  }
}
