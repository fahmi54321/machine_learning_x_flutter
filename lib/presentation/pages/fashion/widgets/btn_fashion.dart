import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_provider.dart';
import 'package:provider/provider.dart';

class BtnFashion extends StatefulWidget {
  const BtnFashion({super.key});

  @override
  State<BtnFashion> createState() => _BtnFashionState();
}

class _BtnFashionState extends State<BtnFashion> {
  void setPressed(bool value) {
    setState(() {
      _isPressed = value;
    });
  }

  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTapCancel: () => setPressed(false),
      onTap: () {
        context.read<FashionPredictorProvider>().predict();
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: _isPressed ? 0.95 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff00c6ff), Color(0xff0072ff)],
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'Generate Prediction',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
