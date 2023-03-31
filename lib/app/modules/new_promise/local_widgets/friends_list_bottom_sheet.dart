import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:alcohol_free/app/data/services/friends_service/friends_service.dart';
import 'package:alcohol_free/app/modules/new_promise/local_widgets/available_friends_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendsListBottomSheet extends StatelessWidget {
  const FriendsListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "목표 지켜봐줄 친구 추가하기",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "닫기",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            Text("추가 가능한 친구 ${FriendsService.to.friendList.length}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 9),
            AvailableFriendsList(),
          ],
        ),
      ),
    );
    ;
  }
}

class AvailableFriendsList extends StatelessWidget {
  AvailableFriendsList({super.key});
  List<AlcoholFreeUserFriend> friends = FriendsService.to.friendList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 172,
        width: MediaQuery.of(context).size.width - 20 * 2,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                AvailableFriendsListItem(friend: friends[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 6),
            itemCount: friends.length));
  }
}
