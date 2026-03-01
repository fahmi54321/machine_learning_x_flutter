import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/button/glass_primary_button.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_provider.dart';
import 'package:provider/provider.dart';

class BtnFashion extends StatelessWidget {
  const BtnFashion({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassPrimaryButton(
      text: 'Generate Prediction',
      onTap: () {
        context.read<FashionPredictorProvider>().predict();
      },
    );
  }
}
