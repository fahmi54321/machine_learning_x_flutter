import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

class BgInsurance extends StatelessWidget {
  const BgInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      decoration: BoxDecoration(gradient: glass.secondaryGradient),
    );
  }
}
