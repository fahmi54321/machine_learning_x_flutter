import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/cubit/predict_cubit.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/widgets/background_salaries.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/widgets/contents/button_salaries.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/widgets/contents/input_salaries.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/widgets/contents/result_salaries.dart';
import 'package:machine_learning_x_flutter/presentation/pages/salaries/widgets/contents/title_salaries.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';

class SalariesPageWrapper extends StatelessWidget {
  const SalariesPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PredictCubit>(),
      child: SalariesPage(),
    );
  }
}

class SalariesPage extends StatelessWidget {
  const SalariesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          BackgroundSalaries(),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: glass.sigmaX,
                    sigmaY: glass.sigmaY,
                  ),
                  child: Container(
                    width: 760,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(
                        alpha: glass.backgroundAlpha,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: theme.colorScheme.outline),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleSalaries(),

                        const SizedBox(height: 28),

                        InputSalaries(),

                        const SizedBox(height: 20),

                        ButtonSalaries(),

                        const SizedBox(height: 30),

                        ResultSalaries(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
