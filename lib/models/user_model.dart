import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String phone;

  UserModel({required this.name, required this.phone});

  Map<String, dynamic> toSnapshot() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot map) {
    return UserModel(
      name: map['name'] ?? 'Username',
      phone: map['phone'] ?? '07XXXXXXXX',
    );
  }

  String toJson() => json.encode(toSnapshot());

  factory UserModel.fromJson(String source) =>
      UserModel.fromSnapshot(json.decode(source));
}
