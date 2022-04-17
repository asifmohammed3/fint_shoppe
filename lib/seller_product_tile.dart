import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SellerProductTile extends StatefulWidget {
  @override
  _SellerProductTileState createState() => _SellerProductTileState();
}

class _SellerProductTileState extends State<SellerProductTile> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('seller').doc(FirebaseAuth.instance.currentUser?.email).collection('products').snapshots();
final db=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(

      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            Map<String, dynamic> data =
                document.data() as Map<String, dynamic> ;

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(data["productname"]),
                  subtitle: Text(data["brand"]),
                  trailing: Text(
                    "₹ ${data['price']}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
