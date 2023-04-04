import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/models/promise.dart';
import 'package:alcohol_free/app/modules/new_promise/new_promise_page_controller.dart';
import 'package:alcohol_free/app/modules/promise/promise_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AvailableFriendsListItem extends StatefulWidget {
  final AlcoholFreeUserFriend friend;

  const AvailableFriendsListItem({super.key, required this.friend});

  @override
  State<AvailableFriendsListItem> createState() =>
      _AvailableFriendsListItemState();
}

class _AvailableFriendsListItemState extends State<AvailableFriendsListItem> {
  bool isSuggested = false;

  Container addButton = Container(
    width: 88,
    height: 36,
    decoration: BoxDecoration(
        color: const Color(0xFFFFF8EE), borderRadius: BorderRadius.circular(9)),
    child: const Icon(Icons.add, color: Color(0xFFFFAC30), size: 18),
  );

  Container suggestedButton = Container(
    width: 88,
    height: 36,
    decoration: BoxDecoration(
        color: const Color(0xFFFFAC30), borderRadius: BorderRadius.circular(9)),
    child: const Icon(Icons.check, color: Colors.white, size: 18),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 172,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFFAC30)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Profile Image
          Container(
            width: 64,
            height: 64,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/empty_profile_circle.png',
              fit: BoxFit.cover,
            ),
          ),
          //Friend name
          Text(
            widget.friend.nickname ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          //Add Button
          TextButton(
              onPressed: isSuggested
                  ? null
                  : () {
                      NewPromisePageController.to
                          .updateSelectedFriends(widget.friend);
                      print(NewPromisePageController.to.selectedFriends);
                      suggestPromise(widget.friend.uid, '');
                      //나중에 여기서는 suggestPromise에서 suggest가 잘 갔을 때 반환받는 플래그를 기준으로 state를 바꿔주는게..
                      setState(() {
                        isSuggested = !isSuggested;
                      });
                    },
              child: isSuggested ? suggestedButton : addButton)
        ],
      ),
    );
  }

  void suggestPromise(String friendUid, String pid) async {
    // await Get.find<NewPromisePageController>().suggestPromise(friendUid, pid);

    Fluttertoast.showToast(
        msg: '추가 요청이 완료되었습니다.',
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.black,
        backgroundColor: Color(0xffF0F0F0));
  }
}
