import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shikishaadmin/controllers/products_controller.dart';
import 'package:shikishaadmin/models/product_model.dart';

ProductsContoller _products = ProductsContoller();

// final productsPStream = StreamProvider<List<ProductModel>>((ref) async* {
//   yield* _products.allProducts;
// });
final productProvider = FutureProvider<List<ProductModel>>((ref) async {
  return _products.allProducts;
});

final productclass = Provider<ProductsContoller>((ref) => ProductsContoller());
