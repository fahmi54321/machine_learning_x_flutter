import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';

class BgFashion extends StatelessWidget {
  const BgFashion({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    return Container(decoration: BoxDecoration(gradient: glass.otherGradient));
  }
}
