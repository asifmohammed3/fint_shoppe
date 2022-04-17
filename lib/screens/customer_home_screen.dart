import 'package:fint_shoppe/seller_product_tile.dart';
import 'package:fint_shoppe/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customer_product_tile.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Product list"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
      body:CustomerProductTile()
    ));
  }
}
