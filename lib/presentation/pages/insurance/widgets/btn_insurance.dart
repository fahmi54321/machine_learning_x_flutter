import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';
import 'package:provider/provider.dart';

class BtnInsurance extends StatefulWidget {
  const BtnInsurance({super.key});

  @override
  State<BtnInsurance> createState() => _BtnInsuranceState();
}

class _BtnInsuranceState extends State<BtnInsurance> {
  bool isPressed = false;

  void setPressed(bool value) {
    setState(() => isPressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setPressed(true),
      onTapUp: (_) => setPressed(false),
      onTapCancel: () => setPressed(false),
      onTap: context.read<InsuranceProvider>().predict,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: isPressed ? 0.95 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff00c6ff), Color(0xff0072ff)],
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Text(
            'Predict Insurance Cost',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
