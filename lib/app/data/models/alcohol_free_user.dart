import 'package:firebase_auth/firebase_auth.dart';

class AlcoholFreeUser {
  String uid;
  String nickname;
  String email;
  String selfDescription;

  // TODO: 사진 field 추가
  AlcoholFreeUser.fromUserCredential(UserCredential credential)
      : uid = credential.user!.uid,
        nickname = credential.user!.displayName ?? "닉네임",
        email = credential.user!.email!,
        selfDescription = "";

  AlcoholFreeUser(this.uid, this.nickname, this.email, this.selfDescription);

  factory AlcoholFreeUser.fromJson(Map<String, dynamic> json) {
    return AlcoholFreeUser(
        json['uid'] as String,
        json['nickname'] as String,
        json['email'] as String,
        json['selfDescription'] as String);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'nickname': nickname,
      'email': email,
      'selfDescription': selfDescription,
    };
  }
}
