import 'package:flutter/material.dart';

class TitleInsurance extends StatelessWidget {
  const TitleInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Insurance Prediction',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
