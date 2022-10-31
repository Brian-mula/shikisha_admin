import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String title;
  String description;
  String img;
  int price;
  String seller;
  String phone;

  ProductModel(
      {required this.title,
      required this.description,
      required this.img,
      required this.price,
      required this.seller,
      required this.phone});

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
      'description': description,
      'img': img,
      'price': price,
      'seller': seller,
      'phone': phone,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot map) {
    return ProductModel(
      title: map['title'] ?? 'title',
      description: map['description'] ?? 'description',
      img: map['img'] ?? 'img',
      price: map['price'] ?? 'price',
      seller: map['seller'] ?? 'seller',
      phone: map['phone'] ?? '07XXXXXXXX',
    );
  }

  String toJson() => json.encode(toSnapshot());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromSnapshot(json.decode(source));
}
