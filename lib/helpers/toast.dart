import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showTostification(
    BuildContext context, ToastificationType type, String title, String text) {
  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flat,
    title: Text(title),
    description: Text(text),
    alignment: Alignment.bottomCenter,
    autoCloseDuration: const Duration(seconds: 3),
    borderRadius: BorderRadius.circular(12.0),
  );
}
