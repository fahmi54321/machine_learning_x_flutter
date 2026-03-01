import 'package:flutter/material.dart';

class TitleFood extends StatelessWidget {
  const TitleFood({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Food Vision',
      style: theme.textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
