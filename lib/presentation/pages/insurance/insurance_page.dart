import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/provider/insurance_provider.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/widgets/bg_insurance.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/widgets/btn_insurance.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/widgets/inputs_insurance.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/widgets/result_insurance.dart';
import 'package:machine_learning_x_flutter/presentation/pages/insurance/widgets/title_insurance.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:provider/provider.dart';

class InsuranceWrapper extends StatelessWidget {
  const InsuranceWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InsuranceProvider(
        insuranceValidationUsecase: sl(),
        insuranceUsecase: sl(),
        converterUsecase: sl(),
      ),
      child: const InsurancePredictionPage(),
    );
  }
}

class InsurancePredictionPage extends StatelessWidget {
  const InsurancePredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgInsurance(),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    width: 850,
                    padding: const EdgeInsets.all(36),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      children: [
                        TitleInsurance(),

                        const SizedBox(height: 30),

                        InputsInsurance(),

                        const SizedBox(height: 28),

                        BtnInsurance(),

                        const SizedBox(height: 30),

                        ResultInsurance(),
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
