import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String phoneNumber;
  final String userName;

  UserModel({
    required this.phoneNumber,
    required this.userName,
  });

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'userName': userName,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    return UserModel(
      phoneNumber: data['number'] ?? 'Some number',
      userName: data['name'] ?? 'Some Name',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromDocumentSnapshot(json.decode(source));
}
