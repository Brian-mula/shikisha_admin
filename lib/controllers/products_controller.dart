import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikishaadmin/models/product_model.dart';

class ProductsContoller {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  // !get all products
  Future<List<ProductModel>> get allProducts async {
    // return _products.snapshots().map((snapshot) {
    //   return snapshot.docs.map((doc) {
    //     return ProductModel.fromSnapshot(doc);
    //   }).toList();
    // });
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("products").get();
    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // ! add a product
  Future<void> addProduct(ProductModel product) async {
    try {
      await _products.add({
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "image": product.img,
        "seller": product.seller,
        "phone": product.phone
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
