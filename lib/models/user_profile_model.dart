import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  late String userId;
  late int avatar;
  late String userName;
  late String userDescription;
  late String userAuthProvider;
  late Timestamp userCreationTime;
  late Timestamp lastUserNameChangeTime;

  UserProfileModel({
    required this.userId,
    required this.avatar,
    required this.userName,
    required this.userDescription,
    required this.userAuthProvider,
    required this.userCreationTime,
    required this.lastUserNameChangeTime,
  });
}
