import 'package:flutter/material.dart';

custSnackBar(context, snackText) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(snackText),
    ),
  );
}
