import 'package:flutter/material.dart';

class TitleFood extends StatelessWidget {
  const TitleFood({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Food Vision',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
