import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/button/glass_primary_button.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';
import 'package:provider/provider.dart';

class BtnInsurance extends StatelessWidget {
  const BtnInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassPrimaryButton(
      text: 'Predict Insurance Cost',
      onTap: context.read<InsuranceProvider>().predict,
    );
  }
}
