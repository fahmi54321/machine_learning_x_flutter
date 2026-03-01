// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:provider/provider.dart';

import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/provider/food_vision_provider.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/widgets/bg_food.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/widgets/btn_food.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/widgets/input_food.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/widgets/result_food.dart';
import 'package:machine_learning_x_flutter/presentation/pages/food_vision/widgets/title_food.dart';

class FoodVisionWrapper extends StatelessWidget {
  const FoodVisionWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodVisionProvider(
        foodUsecase: sl(),
        converterUsecase: sl(),
        fileUsecase: sl(),
        validationFoodUsecase: sl(),
        cameraUsecase: sl(),
        permissionUsecase: sl(),
        appState: sl(),
      ),
      child: FoodVisionPage(),
    );
  }
}

class FoodVisionPage extends StatelessWidget {
  const FoodVisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          BgFood(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: glass.sigmaX,
                    sigmaY: glass.sigmaY,
                  ),
                  child: Container(
                    width: 700,
                    padding: const EdgeInsets.all(36),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(
                        alpha: glass.backgroundAlpha,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: theme.colorScheme.outline),
                    ),
                    child: Column(
                      children: [
                        TitleFood(),

                        const SizedBox(height: 24),
                        InputFood(),
                        const SizedBox(height: 24),

                        BtnFood(),

                        const SizedBox(height: 30),

                        ResultFood(),
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
