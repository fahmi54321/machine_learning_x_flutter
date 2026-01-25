import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

/// ===============================
/// STATE
/// ===============================
class SalaryPredictionState extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;
  bool isPressed = false;

  double salary = 0;
  String insight = '';
  String chartBase64 = '';

  void setPressed(bool value) {
    isPressed = value;
    notifyListeners();
  }

  Future<void> predict() async {
    final exp = double.tryParse(controller.text);
    if (exp == null) return;

    debugPrint('exp: $exp');

    isLoading = true;
    notifyListeners();

    try {
      final res = await http.post(
        Uri.parse('http://10.0.2.2:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'years_experience': exp}),
      );
      debugPrint('res: $res');

      final json = jsonDecode(res.body);
      salary = json['predicted_salary'];
      insight = json['insight'];
      chartBase64 = json['chart_base64'];
    } catch (e) {
      debugPrint('error: $e');
      insight = 'Unable to connect to prediction service.';
    }

    isLoading = false;
    notifyListeners();
  }
}

/// ===============================
/// PAGE (WEB / DESKTOP)
/// ===============================
class SalaryPredictionWebPage extends StatelessWidget {
  const SalaryPredictionWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SalaryPredictionState(),
      child: Consumer<SalaryPredictionState>(
        builder: (context, state, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// BACKGROUND
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
                              Text(
                                'Salary Prediction System',
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Predict employee salary using Simple Linear Regression',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 28),

                              /// INPUT
                              SizedBox(
                                width: 360,
                                child: TextField(
                                  controller: state.controller,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Years of Experience (e.g. 5.5)',
                                    hintStyle: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withValues(
                                      alpha: 0.12,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// BUTTON
                              GestureDetector(
                                onTapDown: (_) => state.setPressed(true),
                                onTapUp: (_) => state.setPressed(false),
                                onTapCancel: () => state.setPressed(false),
                                onTap: () {
                                  state.predict();
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 36,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: state.isPressed
                                        ? Colors.white.withValues(alpha: 0.18)
                                        : Colors.white.withValues(alpha: 0.28),
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      if (!state.isPressed)
                                        const BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 12,
                                          offset: Offset(0, 6),
                                        ),
                                    ],
                                  ),
                                  child: const Text(
                                    'Predict Salary',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// RESULT
                              if (state.isLoading)
                                const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              else if (state.salary > 0)
                                Column(
                                  children: [
                                    Text(
                                      'Estimated Annual Salary',
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '\$${state.salary.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      state.insight,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    if (state.chartBase64.isNotEmpty)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.memory(
                                          base64Decode(state.chartBase64),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                  ],
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
}
