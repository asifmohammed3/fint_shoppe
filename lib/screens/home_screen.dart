import 'package:fint_shoppe/screens/customer_home_screen.dart';
import 'package:fint_shoppe/screens/seller_home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.userType}) : super(key: key);
  String userType;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.userType == "Customer") {
      return const CustomerHomeScreen();
    } else {
      return const SellerHomeScreen();
    }
  }
}
