import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:machine_learning_x_flutter/presentation/core/theme/app_glass_theme.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/provider/startup_provider.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/widgets/button_startup.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/widgets/input_startup.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/widgets/result_startup.dart';
import 'package:machine_learning_x_flutter/presentation/pages/startup/widgets/title_startup.dart';
import 'package:machine_learning_x_flutter/injection/injection.dart';
import 'package:provider/provider.dart';

class StartupWrapper extends StatelessWidget {
  const StartupWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StartupProvider(
        validationStartupUsecase: sl(),
        startupUsecase: sl(),
        converterUsecase: sl(),
        appState: sl(),
      ),
      child: StartupPage(),
    );
  }
}

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final glass = Theme.of(context).extension<AppGlassTheme>()!;
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(gradient: glass.otherGradient)),

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
                    width: 820,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(
                        alpha: glass.backgroundAlpha,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: theme.colorScheme.outline),
                    ),
                    child: Column(
                      children: [
                        TitleStartup(),

                        const SizedBox(height: 28),

                        InputStartup(),

                        const SizedBox(height: 24),

                        ButtonStartup(),

                        const SizedBox(height: 30),

                        ResultStartup(),
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
