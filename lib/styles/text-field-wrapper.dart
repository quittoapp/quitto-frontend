import 'package:flutter/material.dart';

class TextFieldWrapper extends StatelessWidget {
  final Widget child;

  TextFieldWrapper({required this.child});

  Widget build(BuildContext context) {
    return Material(
      elevation: 6.0,
      child: child,
    );
  }
}
