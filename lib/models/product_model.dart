import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String id;
  String title;
  String description;
  String img;
  int price;
  String seller;
  String phone;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.img,
      required this.price,
      required this.seller,
      required this.phone});

  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'img': img,
      'price': price,
      'seller': seller,
      'phone': phone,
    };
  }

  ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!["title"],
        price = doc.data()!['price'],
        description = doc.data()!['description'],
        img = doc.data()!['img'],
        seller = doc.data()!['seller'],
        phone = doc.data()!['phone'];

  String toJson() => json.encode(toSnapshot());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromSnapshot(json.decode(source));
}
