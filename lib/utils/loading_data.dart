import 'package:flutter/material.dart';

class LoadingData extends StatelessWidget {
  const LoadingData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Seus dados estão sendo carregados!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            CircularProgressIndicator(
              color: Color(0xFF4B5D4D),
              semanticsLabel: 'Seus dados estão sendo carregados!',
              strokeCap: StrokeCap.square,
              strokeWidth: 2.0,
            ),
          ],
        ));
  }
}