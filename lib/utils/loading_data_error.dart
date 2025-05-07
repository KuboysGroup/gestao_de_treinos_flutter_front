import 'package:flutter/material.dart';

class ErrorData extends StatelessWidget {
  final Widget error;
  const ErrorData({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: SizedBox(
        height: 256.0,
        child: Column(
          children: [
            const Text('Ops! :('),
            error,
          ],
        ),
      ),
    );
  }
}