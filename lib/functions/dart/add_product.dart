import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddProduct{
  CollectionReference seller = FirebaseFirestore.instance.collection('seller');
  CollectionReference customer = FirebaseFirestore.instance.collection('customer');

  Future<void> addProductSeller(brand, category, productname, price) async{
    String? email =
        FirebaseAuth.instance.currentUser?.email;

    return seller
        .doc(email).collection("products")
        .add({
      'brand': brand,
      'category': category,
      'productname': productname,
      'price': price // 42
    })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add Product: $error"));
  }


  Future<void> addProductCustomer(brand, category, productname, price) async{


    return customer
        .add({
      'brand': brand,
      'category': category,
      'productname': productname,
      'price': price
    })
        .then((value) => print("Product Added"))
        .catchError((error) => print("Failed to add Product: $error"));
  }

}



