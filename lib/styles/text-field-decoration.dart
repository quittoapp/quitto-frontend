import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String? placeholder) {
  return InputDecoration(
    label: Text(placeholder ?? ''),
    border: OutlineInputBorder(),
  );
}
