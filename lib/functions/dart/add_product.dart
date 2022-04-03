import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference products =
    FirebaseFirestore.instance.collection('products');

Future<void> addProduct(brand, category, productname, price) {
  return products
      .add({
        'brand': brand,
        'category': category,
        'productname': productname,
        'price': price // 42
      })
      .then((value) => print("Product Added"))
      .catchError((error) => print("Failed to add Product: $error"));
}
