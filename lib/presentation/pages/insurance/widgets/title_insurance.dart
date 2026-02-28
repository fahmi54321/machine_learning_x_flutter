import 'package:flutter/material.dart';

class TitleInsurance extends StatelessWidget {
  const TitleInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text('Insurance Prediction', style: theme.textTheme.titleLarge);
  }
}
