import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shikishaadmin/models/product_model.dart';

class Products {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  // !get all products
  Stream<List<ProductModel>> get allProducts {
    return _products.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromSnapshot(doc);
      }).toList();
    });
  }
}
