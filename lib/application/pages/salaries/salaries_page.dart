import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/cubit/predict_cubit.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/widgets/background_salaries.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/widgets/contents/button_salaries.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/widgets/contents/input_salaries.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/widgets/contents/result_salaries.dart';
import 'package:machine_learning_x_flutter/application/pages/salaries/widgets/contents/title_salaries.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
          BackgroundSalaries(),

          /// CONTENT
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                  child: Container(
                    width: 760, // desktop width
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// TITLE
                        TitleSalaries(),

                        const SizedBox(height: 28),

                        /// INPUT
                        InputSalaries(),

                        const SizedBox(height: 20),

                        /// BUTTON
                        ButtonSalaries(),

                        const SizedBox(height: 30),

                        /// RESULT
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
