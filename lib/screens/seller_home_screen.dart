import 'package:fint_shoppe/functions/dart/add_product.dart';
import 'package:fint_shoppe/product_tile.dart';
import 'package:fint_shoppe/screens/signin_screen.dart';
import 'package:fint_shoppe/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  TextEditingController brandcontroller = TextEditingController();
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  String category = 'Electronics';

  // List of items in our dropdown menu
  var items = [
    'Electronics',
    'Home Appliances',
    'sports',
    'Footwears',
    'Furniture'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Seller Console"),
              centerTitle: true,
              leading: Icon(Icons.menu),
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          scrollable: true,
                          title: const Text("Add a product"),
                          actions: [
                            CustTextField(
                                controller: brandcontroller,
                                labelText: "Enter Brand name here"),
                            StatefulBuilder(
                              builder: ((context, setState) {
                                return DropdownButton(
                                  value: category,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      category = newValue!;
                                    });
                                  },
                                );
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: CustTextField(
                                  controller: productnamecontroller,
                                  labelText: "Enter name of product "),
                            ),
                            CustTextField(
                                controller: pricecontroller,
                                labelText: "Enter Price of product ",
                                keyboardType: TextInputType.number),
                            ElevatedButton(
                                onPressed: () {
                                  if (brandcontroller.text.isNotEmpty &&
                                      productnamecontroller.text.isNotEmpty &&
                                      pricecontroller.text.isNotEmpty) {
                                    setState(() {
                                      addProduct(
                                          brandcontroller.text,
                                          category,
                                          productnamecontroller.text,
                                          pricecontroller.text);
                                      brandcontroller.clear();
                                      productnamecontroller.clear();
                                      pricecontroller.clear();
                                    });
                                  }

                                  Navigator.of(context).pop();
                                },
                                child: const Text("Add product"))
                          ],
                        ));
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
            body: ProductTile()));
  }
}
