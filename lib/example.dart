import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ExampleState extends ChangeNotifier {
  bool isLoading = false;
  bool isPressed = false;

  String prediction = '';
  String description = '';
  double confidence = 0;
  String trueLabel = '';

  Uint8List? imageBytes;

  void setPressed(bool v) {
    isPressed = v;
    notifyListeners();
  }

  Future<void> predict() async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await http.get(Uri.parse('http://10.0.2.2:5000/predict'));

      final json = jsonDecode(res.body);

      prediction = json['prediction'];
      description = json['description'];
      confidence = json['confidence'];
      trueLabel = json['true_label'];

      imageBytes = base64Decode(json['image_base64']);
    } catch (e) {
      prediction = 'Error';
      description = 'Failed to connect to Flask API';
    }

    isLoading = false;
    notifyListeners();
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExampleState(),
      child: Consumer<ExampleState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// Background
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0f2027),
                        Color(0xff203a43),
                        Color(0xff2c5364),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),

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
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Fashion MNIST Predictor',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 24),

                              /// BUTTON
                              GestureDetector(
                                onTapDown: (_) => state.setPressed(true),
                                onTapUp: (_) => state.setPressed(false),
                                onTapCancel: () => state.setPressed(false),
                                onTap: state.predict,
                                child: AnimatedScale(
                                  duration: const Duration(milliseconds: 150),
                                  scale: state.isPressed ? 0.95 : 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 36,
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff00c6ff),
                                          Color(0xff0072ff),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: const Text(
                                      'Generate Prediction',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// RESULT
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: state.isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : state.imageBytes != null
                                    ? _result(state)
                                    : const SizedBox.shrink(),
                              ),
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
        },
      ),
    );
  }

  Widget _result(ExampleState state) {
    final isCorrect = state.prediction == state.trueLabel;

    final resultColor = isCorrect ? Colors.greenAccent : Colors.redAccent;

    return TweenAnimationBuilder<double>(
      key: ValueKey(state.prediction),
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.8, end: 1),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.06),
          border: Border.all(color: Colors.white24),
          boxShadow: [
            BoxShadow(
              color: resultColor.withOpacity(0.25),
              blurRadius: 30,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.memory(
                state.imageBytes!,
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            /// STATUS BADGE (BENAR / SALAH)
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: resultColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: resultColor),
              ),
              child: Text(
                isCorrect ? "Correct Prediction" : "Incorrect Prediction",
                style: TextStyle(
                  color: resultColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// PREDICTED LABEL
            Text(
              state.prediction,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
            ),

            const SizedBox(height: 6),

            /// SHOW TRUE LABEL IF WRONG
            if (!isCorrect)
              Text(
                "Actual: ${state.trueLabel}",
                style: const TextStyle(color: Colors.white70, fontSize: 15),
              ),

            const SizedBox(height: 18),

            /// CONFIDENCE BAR
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confidence ${(state.confidence * 100).toStringAsFixed(2)}%",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: state.confidence,
                    minHeight: 10,
                    backgroundColor: Colors.white12,
                    valueColor: AlwaysStoppedAnimation(resultColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// DESCRIPTION
            Text(
              state.description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white60, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
