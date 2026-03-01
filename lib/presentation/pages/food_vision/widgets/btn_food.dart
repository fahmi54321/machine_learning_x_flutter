import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/widgets/button/glass_primary_button.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_provider.dart';
import 'package:provider/provider.dart';

class BtnFood extends StatelessWidget {
  const BtnFood({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassPrimaryButton(
      text: 'Generate Prediction',
      onTap: () {
        context.read<FoodVisionProvider>().predict();
      },
    );
  }
}
