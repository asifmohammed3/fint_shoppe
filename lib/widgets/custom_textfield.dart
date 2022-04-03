import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  CustTextField({Key? key,required this.controller,required this.labelText,this.keyboardType}) : super(key: key);
  TextEditingController controller;
  String labelText;
  TextInputType? keyboardType=TextInputType.visiblePassword;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: labelText,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          floatingLabelBehavior:FloatingLabelBehavior.auto,
          fillColor: Colors.white70),
    );
  }
}
