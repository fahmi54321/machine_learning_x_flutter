import 'package:flutter/material.dart';

class BgInsurance extends StatelessWidget {
  const BgInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff141E30), Color(0xff243B55)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
