import 'package:alcohol_free/app/data/models/alcohol_free_user_friend.dart';
import 'package:flutter/material.dart';

class AvailableFriendsListItem extends StatelessWidget {
  final AlcoholFreeUserFriend friend;

  const AvailableFriendsListItem({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 172,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFFAC30)),
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 12,
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
            friend.nickname ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
          //Add Button
          Container(
            width: 88,
            height: 36,
            decoration: BoxDecoration(
                color: const Color(0xFFFFF8EE),
                borderRadius: BorderRadius.circular(9)),
            child: const Icon(Icons.add, color: Color(0xFFFFAC30), size: 18),
          )
        ],
      ),
    );
  }
}
