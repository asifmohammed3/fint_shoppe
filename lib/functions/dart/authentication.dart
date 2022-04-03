import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'custom_snack_bar.dart';

SignUpUser(email, password, context) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      custSnackBar(context, "The password provided is too weak");
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      custSnackBar(context, "The account already exists for that email");
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

SignInUser(email, password, context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      custSnackBar(context, "No user found for that email.");
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      custSnackBar(context, "Wrong password");
      print('Wrong password provided for that user.');
    }
  }
}

VerifyUser(context) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null && !user.emailVerified) {
    await user.sendEmailVerification();
    custSnackBar(context, "Check mail to verify your email");
  }
}
