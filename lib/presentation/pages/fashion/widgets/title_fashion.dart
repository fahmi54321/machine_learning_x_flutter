import 'package:flutter/material.dart';

class TitleFashion extends StatelessWidget {
  const TitleFashion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Fashion MNIST Predictor',
      style: theme.textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
