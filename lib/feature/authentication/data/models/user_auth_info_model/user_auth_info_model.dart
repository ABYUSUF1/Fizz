import 'package:firebase_auth/firebase_auth.dart';

class UserAuthInfoModel {
  final User user;

  UserAuthInfoModel({required this.user});

  String get uid => user.uid;
  String? get displayName => user.displayName;
  String? get email => user.email;
  String? get photoUrl => user.photoURL;

  // Additional methods or properties as needed
}
