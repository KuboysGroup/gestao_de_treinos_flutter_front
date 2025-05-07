import 'package:flutter/material.dart';

InputDecoration getDecoration(String descr) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.grey.withOpacity(0.15),
    hintText: descr,
    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide.none,
    ),
  );
}
