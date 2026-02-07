import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleStartup extends StatelessWidget {
  const TitleStartup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Startup Profit Prediction',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Multiple Linear Regression • Business Insight System',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
