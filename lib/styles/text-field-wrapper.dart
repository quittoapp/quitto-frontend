import 'package:flutter/material.dart';
import 'package:quitto/styles/dimensions.dart';

class TextFieldWrapper extends StatelessWidget {
  final Widget child;
  final String label;

  TextFieldWrapper({required this.child, this.label = ''});

  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label),
      SizedBox(height: Dimensions.m),
      child,
    ]);
  }
}
