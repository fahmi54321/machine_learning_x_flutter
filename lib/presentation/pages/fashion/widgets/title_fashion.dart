import 'package:flutter/material.dart';

class TitleFashion extends StatelessWidget {
  const TitleFashion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Fashion MNIST Predictor',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
