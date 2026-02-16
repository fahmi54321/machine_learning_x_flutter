import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSalaries extends StatelessWidget {
  const TitleSalaries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Salary Prediction System',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Predict employee salary using Simple Linear Regression',
          style: TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ],
    );
  }
}
