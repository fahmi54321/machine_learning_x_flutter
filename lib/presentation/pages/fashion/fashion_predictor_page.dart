import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/provider/fashion_predictor_provider.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/widgets/bg_fashion.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/widgets/btn_fashion.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/widgets/result_fashion.dart';
import 'package:machine_learning_x_flutter/presentation/pages/fashion/widgets/title_fashion.dart';
import 'package:provider/provider.dart';

class FashionPredictorWrapper extends StatelessWidget {
  const FashionPredictorWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FashionPredictorProvider(
        fashionUsecase: sl(),
        converterUsecase: sl(),
        appState: sl(),
      ),
      child: FashionPredictorPage(),
    );
  }
}

class FashionPredictorPage extends StatelessWidget {
  const FashionPredictorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgFashion(),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                  child: Container(
                    width: 700,
                    padding: const EdgeInsets.all(36),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      children: [
                        TitleFashion(),

                        const SizedBox(height: 24),

                        BtnFashion(),

                        const SizedBox(height: 30),

                        ResultFashion(),
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
